import 'dart:convert';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:test/test.dart';

void main() {
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
          publishableKey: 'NOT A PUBLISHABLE KEY',
          persistor: Persistor.none,
          httpService: HttpService.none,
        ),
        throwsA(const TypeMatcher<FormatException>()),
      );
    });

    test('will pass when encoded part follows underscore', () {
      final result = Api(
        publishableKey: publishableKey,
        persistor: Persistor.none,
        httpService: HttpService.none,
      );
      expect(result.domain, isA<String>());
    });

    test('will return correct domain from decoded key', () {
      final result = Api(
        publishableKey: publishableKey,
        persistor: Persistor.none,
        httpService: HttpService.none,
      );
      expect(result.domain, domain);
    });
  });
}
