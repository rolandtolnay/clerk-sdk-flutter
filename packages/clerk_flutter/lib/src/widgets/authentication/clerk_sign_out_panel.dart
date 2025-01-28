import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkSignOutPanel] renders a UI for signing out users.
///
@immutable
class ClerkSignOutPanel extends StatefulWidget {
  /// Constructs a new [ClerkSignOutPanel].
  const ClerkSignOutPanel({super.key});

  @override
  State<ClerkSignOutPanel> createState() => _ClerkSignOutPanelState();
}

class _ClerkSignOutPanelState extends State<ClerkSignOutPanel>
    with ClerkTelemetryStateMixin {
  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    return Padding(
      padding: horizontalPadding16,
      child: ClerkButton(
        onPressed: () => authState.signOut(),
        label: Text(authState.translator.translate('Sign Out')),
      ),
    );
  }
}
