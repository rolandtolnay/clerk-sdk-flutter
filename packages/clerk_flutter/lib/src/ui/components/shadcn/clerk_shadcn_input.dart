import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// shadcn-ui implementation of a Clerk input field.
class ClerkShadcnInput extends StatelessWidget {
  /// Creates a new [ClerkShadcnInput].
  const ClerkShadcnInput({
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

  /// Optional label.
  final String? label;

  /// Is this field optional?
  final bool optional;

  /// can we see the text or not?
  final bool obscureText;

  /// Should the input box immediately take focus?
  final bool autofocus;

  /// Report changes back to calling widget
  final ValueChanged<String>? onChanged;

  /// Callback for when field submitted
  final ValueChanged<String>? onSubmit;

  /// initial value
  final String? initial;

  /// function to change obscurity
  final VoidCallback? onObscure;

  /// Is the string valid yet?
  /// NB: NOT a [FormFieldValidator], just returns a boolean
  final bool Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return _ShadcnInputField(
      label: label,
      optional: optional,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmit: onSubmit,
      initial: initial,
      onObscure: onObscure,
      validator: validator,
      autofocus: autofocus,
      translator: translator,
    );
  }
}

class _ShadcnInputField extends StatefulWidget {
  const _ShadcnInputField({
    required this.label,
    required this.optional,
    required this.obscureText,
    required this.onChanged,
    required this.onSubmit,
    required this.initial,
    required this.onObscure,
    required this.validator,
    required this.autofocus,
    required this.translator,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final String? label;
  final bool optional;
  final bool obscureText;
  final bool autofocus;
  final VoidCallback? onObscure;
  final bool Function(String?)? validator;
  final String? initial;
  final ClerkTranslator translator;

  @override
  State<_ShadcnInputField> createState() => _ShadcnInputFieldState();
}

class _ShadcnInputFieldState extends State<_ShadcnInputField> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.label!,
                  style: textTheme.small,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
              if (widget.optional) ...[
                const SizedBox(width: 8),
                Text(
                  widget.translator.translate('Optional'),
                  style: textTheme.muted,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
        ],
        ShadInput(
          initialValue: widget.initial,
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          onChanged: (value) {
            if (widget.validator?.call(value) case bool valid) {
              setState(() => _isValid = valid);
            }
            widget.onChanged?.call(value);
          },
          onSubmitted: widget.onSubmit,
          decoration: ShadDecoration(
            border:
                _isValid ? ShadBorder.all() : ShadBorder.all(color: Colors.red),
            secondaryBorder:
                _isValid ? ShadBorder.all() : ShadBorder.all(color: Colors.red),
          ),
          suffix: widget.onObscure != null
              ? ShadButton(
                  width: 32,
                  height: 32,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 16,
                  ),
                  onPressed: widget.onObscure,
                )
              : null,
        ),
      ],
    );
  }
}
