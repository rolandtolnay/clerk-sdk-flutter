import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Create a [ClerkPanel] with rounded corners and shadow
/// to hold specialised pieces of UI
///
class ClerkPanel extends StatelessWidget {
  /// Construct a [ClerkPanel]
  const ClerkPanel({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  /// the [Widget] to display inside the panel
  final Widget child;

  /// the [padding] to apply to the child
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.clerkSubtitleDark.copyWith(height: 1.0),
      child: DecoratedBox(
        decoration: inputBoxBorderDecoration,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
