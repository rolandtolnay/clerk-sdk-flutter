import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Sign in to an additional account
class ManageAccountScreen extends StatelessWidget {
  /// Construct a [ManageAccountScreen]
  const ManageAccountScreen._({
    required this.authState,
  });

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// The name of the route to this screen
  static const routeName = 'clerk_add_account';

  /// static method to show an [AddAccountScreen]
  static Future<void> show(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return ManageAccountScreen._(authState: authState);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      authState: authState,
      child: Scaffold(
        backgroundColor: ClerkColors.whiteSmoke,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: horizontalPadding24 + bottomPadding16,
          child: const ClerkUserProfile(),
        ),
      ),
    );
  }
}
