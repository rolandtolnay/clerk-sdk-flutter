import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../clerk_button.dart';

/// shadcn-ui implementation of a Clerk button.
class ClerkShadcnButton extends StatelessWidget {
  /// Creates a new [ClerkShadcnButton].
  const ClerkShadcnButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 32.0,
    this.square = false,
    this.style = ClerkButtonStyle.light,
  });

  /// The label to display on the button
  final Widget label;

  /// Called when the button is tapped
  final VoidCallback? onPressed;

  /// The height of the button
  final double height;

  /// Whether the button should be square (width = height)
  final bool square;

  /// The style variant of the button
  final ClerkButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      ClerkButtonStyle.light => ShadButton.secondary(
          onPressed: onPressed,
          height: height,
          child: label,
        ),
      ClerkButtonStyle.dark => ShadButton(
          onPressed: onPressed,
          height: height,
          child: label,
        ),
    };
  }
}
