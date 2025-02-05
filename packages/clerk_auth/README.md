<p align="center">
<img src="https://images.clerk.com/static/logo-light-mode-400x400.png" height="90">
</p>

## Official [Clerk](https://clerk.com) Dart SDK (Pre-release Alpha)

[![Pub Version](https://img.shields.io/pub/v/clerk_auth?color=blueviolet)](https://pub.dev/packages/clerk_auth)
[![Pub Points](https://img.shields.io/pub/points/clerk_auth?label=pub%20points)](https://pub.dev/packages/clerk_auth/score)
[![chat on Discord](https://img.shields.io/discord/856971667393609759.svg?logo=discord)](https://discord.com/invite/b5rXHjAg7A)
[![documentation](https://img.shields.io/badge/documentation-clerk-green.svg)](https://clerk.com/docs)
[![twitter](https://img.shields.io/twitter/follow/ClerkDev?style=social)](https://twitter.com/intent/follow?screen_name=ClerkDev)

> ### ⚠️ The Clerk Flutter SDK is in Alpha and not recommended for use in production. ⚠️
> ❗️ Breaking changes should be expected until the first stable release (1.0.0) ❗️

**Clerk helps developers build user management. We provide streamlined user experiences
for your users to sign up, sign in, and manage their profile from your Dart code.**

## Requirements

* Dart >= 3.0.0

## Example Usage

To use this package you will need to go to your [Clerk Dashboard](https://dashboard.clerk.com/)
create an application and copy the public and publishable API keys into your project.

```dart
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    publishableKey: '<YOUR-PUBLISHABLE-KEY>',
    persistor: await DefaultPersistor.create(
      storageDirectory: Directory.current,
    ),
  );

  Client client;

  client = await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: '<USER-EMAIL>',
  );
  assert(client.signIn?.status == Status.needsFirstFactor);

  client = await auth.attemptSignIn(
    strategy: Strategy.password,
    password: '<PASSWORD>',
  );

  assert(client.signIn == null);
  assert(client.activeSession?.status == Status.active);
  assert(client.activeSession?.publicUserData.identifier.isNotEmpty == true);
}

```

For more details see [Clerk Auth object](https://pub.dev/documentation/clerk_auth/latest/clerk_auth/Auth-class.html)

## License

This SDK is licensed under the MIT license found in the [LICENSE](./LICENSE) file.
