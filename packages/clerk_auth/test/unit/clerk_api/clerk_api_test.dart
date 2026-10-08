import 'dart:async';
import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/auth_config.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:http/http.dart' show Response;
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  for (final (path, delete, sessionId, retryResponse) in [
    ('/v1/client', (Api api) => api.signOut(), null, null),
    (
      '/v1/me',
      (Api api) => api.deleteUser(),
      'session-test',
      Response('{}', 429, headers: {'retry-after': '0'}),
    ),
  ]) {
    test('$path retains request credentials and clears local credentials',
        () async {
      final storage = _MemoryPersistor();
      final httpService = _RecordingHttpService()
        ..response = Response(
          jsonEncode({
            'client': {
              'id': 'client-test',
              'sessions': [
                {
                  'id': 'session-test',
                  'status': 'active',
                  'public_user_data': {},
                  'user': {
                    'id': 'user-test',
                    'create_organization_enabled': false
                  },
                },
              ],
            },
          }),
          200,
          headers: {'authorization': 'test-client-credential'},
        );
      final api = Api(
        config: AuthConfig(
          publishableKey:
              'pk_test_${base64.encode(utf8.encode('clerk.example.com\$'))}',
          localesLookup: testLocalesLookup,
        ),
        persistor: storage,
        httpService: httpService,
      );
      await api.createSignIn(identifier: 'user@example.com');
      expect(storage.values, isNotEmpty);

      final network = Completer<Response>();
      httpService.pendingResponse = network.future;
      final deleting = delete(api);
      try {
        expect(storage.values, isEmpty);
      } finally {
        httpService.pendingResponse = null;
        httpService.response = Response('{"response":{}}', 200);
        if (retryResponse == null) {
          network.completeError(StateError('Offline'));
        } else {
          network.complete(retryResponse);
        }
        await deleting;
      }
      expect(httpService.method, HttpMethod.delete);
      expect(httpService.uri?.path, path);
      expect(httpService.headers?['authorization'], 'test-client-credential');
      expect(httpService.uri?.queryParameters['_clerk_session_id'], sessionId);
      expect(storage.values, isEmpty);

      await api.currentClient();
      expect(httpService.headers, isNot(contains('authorization')));
    });
  }

  group('Request normalization', () {
    late Api api;
    late _RecordingHttpService httpService;

    setUp(() {
      httpService = _RecordingHttpService();
      api = Api(
        config: AuthConfig(
          publishableKey:
              'pk_test_${base64.encode(utf8.encode('clerk.example.com\$'))}',
          localesLookup: testLocalesLookup,
        ),
        persistor: Persistor.none,
        httpService: httpService,
      );
    });

    test('sign-in preserves password whitespace while trimming identifiers',
        () async {
      await api.createSignIn(
        identifier: ' user@example.com \t',
        password: ' \tsecret password\n ',
      );

      expect(httpService.params, {
        'identifier': 'user@example.com',
        'password': ' \tsecret password\n ',
      });
    });

    test('sign-in sends an explicit empty password for server validation',
        () async {
      await api.createSignIn(password: '');

      expect(httpService.params, {'password': ''});
    });

    test('sign-in omits null passwords and blank ordinary fields', () async {
      await api.createSignIn(identifier: ' \t ', password: null);

      expect(httpService.params, isEmpty);
    });

    test('password updates preserve current and new password whitespace',
        () async {
      await api.updatePassword(
          ' current password\t ', '\n new password ', true);

      expect(httpService.params, {
        'current_password': ' current password\t ',
        'new_password': '\n new password ',
        'sign_out_of_other_sessions': true,
      });
    });
  });

  group('Derive domain from publishable key', () {
    late final String domain;
    late final String publishableKey;

    setUpAll(() {
      domain = 'https://some.domain/';
      publishableKey = 'publishable_key_${base64.encode(utf8.encode(domain))}';
    });

    test('will fail unless encoded part follows underscore', () {
      expect(
        () => Api(
          config: const AuthConfig(
            publishableKey: 'NOT A PUBLISHABLE KEY',
            localesLookup: testLocalesLookup,
          ),
          persistor: Persistor.none,
          httpService: noneHttpService,
        ),
        throwsA(const TypeMatcher<FormatException>()),
      );
    });

    test('will pass when encoded part follows underscore', () {
      final result = Api(
        config: AuthConfig(
          publishableKey: publishableKey,
          localesLookup: testLocalesLookup,
        ),
        persistor: Persistor.none,
        httpService: noneHttpService,
      );
      expect(result.domain, isA<String>());
    });

    test('will return correct domain from decoded key', () {
      final result = Api(
        config: AuthConfig(
          publishableKey: publishableKey,
          localesLookup: testLocalesLookup,
        ),
        persistor: Persistor.none,
        httpService: noneHttpService,
      );
      expect(result.domain, domain);
    });
  });
}

class _RecordingHttpService extends NoneHttpService {
  Map<String, dynamic>? params;
  Map<String, String>? headers;
  HttpMethod? method;
  Uri? uri;
  Response response = Response('{"response":{}}', 200);
  Future<Response>? pendingResponse;

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    this.params = {...?params};
    this.headers = {...?headers};
    this.method = method;
    this.uri = uri;
    return await pendingResponse ?? response;
  }
}

class _MemoryPersistor implements Persistor {
  final values = <String, Object?>{};

  @override
  T? read<T>(String key) => values[key] as T?;

  @override
  void write<T>(String key, T value) => values[key] = value;

  @override
  void delete(String key) => values.remove(key);
}
