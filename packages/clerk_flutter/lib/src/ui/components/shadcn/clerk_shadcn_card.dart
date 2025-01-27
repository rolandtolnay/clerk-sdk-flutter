import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// shadcn-ui implementation of a Clerk card.
class ClerkShadcnCard extends StatelessWidget {
  /// Creates a new [ClerkShadcnCard].
  const ClerkShadcnCard({
    super.key,
    required this.topPortion,
    this.bottomPortion,
    this.middlePortion,
  });

  /// Widget to be displayed in the elevated top card in the stack.
  final Widget topPortion;

  /// Widget to be displayed under the topPortion
  final Widget? middlePortion;

  /// Widget to be displayed in the bottom card of the stack. Typically branding and a
  /// text based c.t.a.
  final Widget? bottomPortion;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShadCard(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topPortion,
                if (middlePortion case Widget middlePortion) //
                  middlePortion,
              ],
            ),
          ),
          if (bottomPortion case Widget bottomPortion) //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: bottomPortion,
            ),
          Divider(color: theme.colorScheme.border),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              height: 14.0,
              width: 121.46,
              child: SvgPicture.asset(
                ClerkAssets.securedByClerkLogo,
                package: 'clerk_flutter',
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.muted,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
