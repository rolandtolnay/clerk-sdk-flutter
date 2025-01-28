import 'package:flutter/widgets.dart';

import '../../../clerk_flutter.dart';

/// A button widget that adapts its appearance based on the current UI configuration.
class ClerkButton extends StatelessWidget {
  /// Creates a new [ClerkButton].
  const ClerkButton({
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
    final config = ClerkUIConfig.of(context);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkMaterialButton(
          label: label,
          onPressed: onPressed,
          height: height,
          square: square,
          style: style.materialStyle,
        ),
      ClerkShadcnUIConfig() => ClerkShadcnButton(
          label: label,
          onPressed: onPressed,
          height: height,
          square: square,
          style: style,
        ),
    };
  }
}

/// Style variants for Clerk buttons.
enum ClerkButtonStyle {
  /// Light style button
  light,

  /// Dark style button
  dark;

  ClerkMaterialButtonStyle get materialStyle => switch (this) {
        ClerkButtonStyle.light => ClerkMaterialButtonStyle.light,
        ClerkButtonStyle.dark => ClerkMaterialButtonStyle.dark,
      };
}
