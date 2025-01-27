import 'package:flutter/widgets.dart';

import 'clerk_ui_config.dart';

/// Provides [ClerkUIConfig] to the widget tree.
///
/// Use [ClerkUIProvider.of] to access the configuration from child widgets.
class ClerkUIProvider extends InheritedWidget {
  /// Provides [ClerkUIConfig] to the widget tree.
  ///
  /// Use [ClerkUIProvider.of] to access the configuration from child widgets.
  const ClerkUIProvider({
    super.key,
    required this.config,
    required super.child,
  });

  /// The UI configuration to be provided to child widgets
  final ClerkUIConfig config;

  @override
  bool updateShouldNotify(ClerkUIProvider oldWidget) {
    return config != oldWidget.config;
  }
}
