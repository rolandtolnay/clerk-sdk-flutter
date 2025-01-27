import 'dart:core';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:example/persistor/file_persistor.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'persistor/memory_persistor.dart';

// TODO: Add your publishable key here
const key = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpLogging(printer: const LogPrinter());

  final appDirectory = await getApplicationDocumentsDirectory();
  final persistor = await FilePersistor.create(storageDirectory: appDirectory);

  runApp(ExampleApp(publishableKey: key, persistor: persistor));
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({
    super.key,
    required this.publishableKey,
    this.persistor,
  });

  final String publishableKey;
  final Persistor? persistor;

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late final Persistor persistor;

  @override
  void initState() {
    persistor = widget.persistor ?? MemoryPersistor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      publishableKey: widget.publishableKey,
      persistor: persistor,
      sendTelemetryData: false,
      child: ShadApp(
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
                  signedInBuilder: (context, auth) => Column(
                    children: [
                      Spacer(),
                      const ClerkUserButton(),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          final jwt = await auth.sessionToken();
                          print(
                              'JWT: ${jwt == null ? 'null' : jwt.isEmpty ? 'empty' : jwt}');
                        },
                        child: const Text('Print JWT'),
                      ),
                      Spacer(),
                    ],
                  ),
                  signedOutBuilder: (context, auth) {
                    return const ClerkAuthenticationWidget(
                      uiConfig: ClerkShadcnUIConfig(),
                    );
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
  void print(String output) => debugPrint(output);
}
