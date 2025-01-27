import 'package:flutter/widgets.dart';

import '../../../clerk_flutter.dart';
import 'shadcn/clerk_shadcn_card.dart';

/// A Clerk themed card component that adapts to the current UI configuration.
class ClerkCard extends StatelessWidget {
  /// Constructs a new [ClerkCard].
  const ClerkCard({
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
    final config = ClerkUIConfig.of(context);
    final card = switch (config) {
      ClerkShadcnUIConfig() => ClerkShadcnCard(
          topPortion: topPortion,
          middlePortion: middlePortion,
          bottomPortion: bottomPortion,
        ),
      ClerkMaterialUIConfig() => ClerkVerticalCard(
          topPortion: topPortion,
          middlePortion: middlePortion,
          bottomPortion: bottomPortion ?? const SizedBox.shrink(),
        ),
    };
    return card;
  }
}
