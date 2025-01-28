import 'package:flutter/widgets.dart';

import '../../clerk_flutter.dart';

/// Base configuration class for Clerk UI components.
///
/// This class defines the interface for UI configurations and provides
/// factory constructors for different UI styles.
@immutable
sealed class ClerkUIConfig {
  /// Base configuration class for Clerk UI components.
  ///
  /// This class defines the interface for UI configurations and provides
  /// factory constructors for different UI styles.
  const ClerkUIConfig();

  /// Creates a Material Design styled configuration
  factory ClerkUIConfig.material() => const ClerkMaterialUIConfig();

  /// Creates a shadcn-ui styled configuration
  factory ClerkUIConfig.shadcn() => const ClerkShadcnUIConfig();

  /// Gets the current UI configuration from the widget tree.
  static ClerkUIConfig of(BuildContext context) {
    final provider = context.findAncestorWidgetOfExactType<ClerkUIProvider>();
    return provider?.config ?? const ClerkMaterialUIConfig();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClerkUIConfig && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// shadcn-ui implementation of [ClerkUIConfig].
class ClerkShadcnUIConfig extends ClerkUIConfig {
  /// shadcn-ui implementation of [ClerkUIConfig].
  const ClerkShadcnUIConfig();
}

/// Material Design implementation of [ClerkUIConfig].
class ClerkMaterialUIConfig extends ClerkUIConfig {
  /// Material Design implementation of [ClerkUIConfig].
  const ClerkMaterialUIConfig();
}

/// Extension on [BuildContext] to provide convenient access to Clerk UI configuration.
extension ClerkUIConfigExtension on BuildContext {
  /// Gets the current [ClerkUIConfig] from the widget tree.
  ClerkUIConfig get clerkUIConfig => ClerkUIConfig.of(this);

  /// Whether the current UI configuration is Material Design.
  bool get isMaterial => clerkUIConfig is ClerkMaterialUIConfig;

  /// Whether the current UI configuration is shadcn-ui.
  bool get isShadcn => clerkUIConfig is ClerkShadcnUIConfig;
}
