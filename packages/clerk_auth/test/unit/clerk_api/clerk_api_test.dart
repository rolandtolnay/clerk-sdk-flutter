import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/auth_config.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:http/http.dart' show Response;
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
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

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    this.params = {...?params};
    return Response('{"response":{}}', 200);
  }
}
