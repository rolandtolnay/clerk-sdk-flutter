import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../ui/clerk_ui_config.dart';

/// A Clerk-branded text style.
///
/// This class provides a set of Clerk-branded text styles that can be used to
/// style text in widgets.
class ClerkTextStyle {
  const ClerkTextStyle._();

  /// The Clerk-branded text style for headings.
  static const title = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: ClerkColors.darkJungleGreen,
  );

  /// The Clerk-branded text style for subheadings.
  static const subtitle = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.stormGrey,
  );

  /// The Clerk-branded text style for button titles.
  static const buttonTitle = TextStyle(
    fontSize: 12.0,
    color: ClerkColors.stormGrey,
  );

  /// The Clerk-branded text style for button subtitles.
  static const buttonSubtitle = TextStyle(
    fontSize: 10.0,
    color: ClerkColors.midGrey,
  );

  /// The Clerk-branded text style for subheadings in the user profile widget.
  static const subtitleDark = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.darkJungleGreen,
  );

  /// The Clerk-branded text style for input field labels.
  static const inputLabel = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.darkJungleGreen,
    letterSpacing: 0.1,
    height: 0.95,
  );

  /// The Clerk-branded text style for user button titles.
  static const userButtonTitle = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.midGrey,
  );

  /// The Clerk-branded text style for user button subtitles.
  static const userButtonSubtitle = TextStyle(
    fontSize: 12.0,
    color: ClerkColors.mountainMist,
  );

  /// The Clerk-branded text style for errors.
  static const error = TextStyle(
    fontSize: 14.0,
    color: ClerkColors.incarnadine,
  );

  /// The Clerk-branded text style for row labels.
  static const rowLabel = TextStyle(
    fontSize: 5.0,
    height: 1.3,
  );
}

/// Extension methods for accessing Clerk text styles through BuildContext.
extension ClerkTextStyleX on BuildContext {
  /// Gets the title text style based on the current UI configuration.
  TextStyle get clerkTitle {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.title,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.h3,
    };
  }

  /// Gets the subtitle text style based on the current UI configuration.
  TextStyle get clerkSubtitle {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.subtitle,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.muted,
    };
  }

  /// Gets the dark subtitle text style based on the current UI configuration.
  TextStyle get clerkSubtitleDark {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.subtitleDark,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.p,
    };
  }

  /// Gets the input label text style based on the current UI configuration.
  TextStyle get clerkInputLabel {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.inputLabel,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.small,
    };
  }

  /// Gets the button title text style based on the current UI configuration.
  TextStyle get clerkButtonTitle {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.buttonTitle,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.small,
    };
  }

  /// Gets the button subtitle text style based on the current UI configuration.
  TextStyle get clerkButtonSubtitle {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.buttonSubtitle,
      ClerkShadcnUIConfig() =>
        ShadTheme.of(this).textTheme.muted.copyWith(fontSize: 10.0),
    };
  }

  /// Gets the error text style based on the current UI configuration.
  TextStyle get clerkError {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.error,
      ClerkShadcnUIConfig() => ShadTheme.of(this).textTheme.p.copyWith(
            color: ShadTheme.of(this).colorScheme.destructive,
          ),
    };
  }

  /// Gets the row label text style based on the current UI configuration.
  TextStyle get clerkRowLabel {
    final config = ClerkUIConfig.of(this);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextStyle.rowLabel,
      ClerkShadcnUIConfig() =>
        ShadTheme.of(this).textTheme.small.copyWith(fontSize: 5.0, height: 1.3),
    };
  }
}
