import 'package:flutter/widgets.dart';

import '../../../clerk_flutter.dart';

/// A form field widget that adapts its appearance based on the current UI configuration.
class ClerkInput extends StatelessWidget {
  /// Creates a new [ClerkInput].
  const ClerkInput({
    super.key,
    this.label,
    this.optional = false,
    this.obscureText = false,
    this.autofocus = false,
    this.onChanged,
    this.onSubmit,
    this.initial,
    this.onObscure,
    this.validator,
  });

  /// Report changes back to calling widget
  final ValueChanged<String>? onChanged;

  /// Callback for when field submitted
  final ValueChanged<String>? onSubmit;

  /// Optional label.
  final String? label;

  /// Is this field optional?
  final bool optional;

  /// can we see the text or not?
  final bool obscureText;

  /// Should the input box immediately take focus?
  final bool autofocus;

  /// function to change obscurity
  final VoidCallback? onObscure;

  /// Is the string valid yet?
  /// NB: NOT a [FormFieldValidator], just returns a boolean
  final bool Function(String?)? validator;

  /// initial value
  final String? initial;

  @override
  Widget build(BuildContext context) {
    final config = ClerkUIConfig.of(context);
    return switch (config) {
      ClerkMaterialUIConfig() => ClerkTextFormField(
          label: label,
          optional: optional,
          obscureText: obscureText,
          autofocus: autofocus,
          onChanged: onChanged,
          onSubmit: onSubmit,
          initial: initial,
          onObscure: onObscure,
          validator: validator,
        ),
      ClerkShadcnUIConfig() => ClerkShadcnInput(
          label: label,
          optional: optional,
          obscureText: obscureText,
          autofocus: autofocus,
          onChanged: onChanged,
          onSubmit: onSubmit,
          initial: initial,
          onObscure: onObscure,
          validator: validator,
        ),
    };
  }
}
