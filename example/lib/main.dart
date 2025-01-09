import 'dart:async';
import 'dart:core';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/logging.dart';
import 'package:flutter/material.dart';

// TODO: Add your publishable key here
const key = '';

Future<void> main() async {
  await setUpLogging(printer: const LogPrinter());

  runApp(const ExampleApp(publishableKey: key));
}

final tokenPersistor = TokenPersistor();

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key, required this.publishableKey});

  final String publishableKey;

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      publishableKey: publishableKey,
      persistor: tokenPersistor,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? child) {
          return ClerkErrorListener(child: child!);
        },
        home: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: SafeArea(
            child: Padding(
              padding: horizontalPadding32,
              child: Center(
                child: ClerkAuthBuilder(
                  signedInBuilder: (context, auth) => const ClerkUserButton(),
                  signedOutBuilder: (context, auth) {
                    return const ClerkAuthenticationWidget();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogPrinter extends Printer {
  const LogPrinter();

  @override
  void print(String output) {
    Zone.root.print(output);
  }
}

class TokenPersistor implements clerk.Persistor {
  final Map<String, String> _tokens = {};

  @override
  FutureOr<void> delete(String key) {
    print('Deleting for key [$key]');
    _tokens.remove(key);
  }

  @override
  FutureOr<T?> read<T>(String key) {
    print('Reading for key [$key]');
    return _tokens[key] as T?;
  }

  @override
  FutureOr<void> write<T>(String key, T value) {
    print('Writing...');
    print('[$key]: \n$value');
    _tokens[key] = value as String;
  }
}
