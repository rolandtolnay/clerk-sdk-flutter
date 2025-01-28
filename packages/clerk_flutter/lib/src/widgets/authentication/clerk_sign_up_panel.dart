import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkSignUpPanel] renders a UI for signing up users.
///
/// The functionality of the [ClerkSignUpPanel] is controlled by the instance settings
/// you specify in your Clerk Dashboard, such as sign-in and social connections. You can
/// further customize your [ClerkSignUpPanel] by passing additional properties.
///
/// https://clerk.com/docs/components/authentication/sign-up
///
@immutable
class ClerkSignUpPanel extends StatefulWidget {
  /// Construct a new [ClerkSignUpPanel]
  const ClerkSignUpPanel({super.key});

  @override
  State<ClerkSignUpPanel> createState() => _ClerkSignUpPanelState();
}

class _ClerkSignUpPanelState extends State<ClerkSignUpPanel>
    with ClerkTelemetryStateMixin {
  static final _phoneNumberRE = RegExp(r'[^0-9+]');

  final _values = <clerk.UserAttribute, String>{};
  bool _obscurePassword = true;

  Future<void> _continue(ClerkAuthState auth,
      {String? code, clerk.Strategy? strategy}) async {
    await auth(context, () async {
      final password = _values[clerk.UserAttribute.password];
      final passwordConfirmation =
          _values[clerk.UserAttribute.passwordConfirmation];
      if (auth.checkPassword(password, passwordConfirmation)
          case String errorMessage) {
        auth.addError(errorMessage);
      } else {
        await auth.attemptSignUp(
          strategy: strategy ?? clerk.Strategy.password,
          firstName: _values[clerk.UserAttribute.firstName],
          lastName: _values[clerk.UserAttribute.lastName],
          username: _values[clerk.UserAttribute.username],
          emailAddress: _values[clerk.UserAttribute.emailAddress],
          phoneNumber: _values[clerk.UserAttribute.phoneNumber]
              ?.replaceAll(_phoneNumberRE, ''),
          password: password,
          passwordConfirmation: passwordConfirmation,
          code: code,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final translator = authState.translator;
    final env = authState.env;
    final attributes = [
      ...env.user.attributes.entries
          .where((a) => a.value.isEnabled)
          .map(_Attribute.fromMapEntry),
      const _Attribute(clerk.UserAttribute.passwordConfirmation, true),
    ]..sort((a, b) => a.index - b.index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Closeable(
          closed: authState.signUp?.unverified(clerk.Field.phoneNumber) != true,
          child: Padding(
            padding: verticalPadding8,
            child: ClerkCodeInput(
              key: const Key('phone_code'),
              title: translator.translate('Verify your phone number'),
              subtitle: translator.translate(
                'Enter code sent to ###',
                substitution: _values[clerk.UserAttribute.phoneNumber],
              ),
              onSubmit: (code) async {
                await _continue(
                  authState,
                  strategy: clerk.Strategy.phoneCode,
                  code: code,
                );
                return false;
              },
            ),
          ),
        ),
        Closeable(
          closed:
              authState.signUp?.unverified(clerk.Field.emailAddress) != true,
          child: Padding(
            padding: verticalPadding8,
            child: ClerkCodeInput(
              key: const Key('email_code'),
              title: translator.translate('Verify your email address'),
              subtitle: translator.translate(
                'Enter code sent to ###',
                substitution: _values[clerk.UserAttribute.emailAddress],
              ),
              onSubmit: (code) async {
                await _continue(authState,
                    strategy: clerk.Strategy.emailCode, code: code);
                return false;
              },
            ),
          ),
        ),
        Closeable(
          closed: authState.signUp?.unverifiedFields.isNotEmpty == true,
          child: Column(
            children: [
              for (final attribute in attributes)
                Padding(
                  padding: bottomPadding24,
                  child: attribute.isPhoneNumber
                      ? ClerkPhoneNumberFormField(
                          initial: _values[attribute.attr],
                          label: attribute.title,
                          optional: attribute.isOptional,
                          onChanged: (value) => _values[attribute.attr] = value,
                        )
                      : ClerkInput(
                          initial: _values[attribute.attr],
                          label: attribute.title,
                          optional: attribute.isOptional,
                          obscureText:
                              attribute.needsObscuring && _obscurePassword,
                          onObscure: attribute.needsObscuring
                              ? () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  )
                              : null,
                          onChanged: (value) => _values[attribute.attr] = value,
                        ),
                ),
            ],
          ),
        ),
        ClerkButton(
          onPressed: () => _continue(authState),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text(translator.translate('Continue'))),
              horizontalMargin4,
              const Icon(Icons.arrow_right_sharp),
            ],
          ),
        ),
        verticalMargin32,
      ],
    );
  }
}

class _Attribute {
  const _Attribute(this.attr, this.isRequired);

  factory _Attribute.fromMapEntry(
    MapEntry<clerk.UserAttribute, clerk.UserAttributeData> entry,
  ) =>
      _Attribute(entry.key, entry.value.isRequired);

  final clerk.UserAttribute attr;
  final bool isRequired;

  int get index => attr.index;

  bool get needsObscuring => attr.isPassword;

  bool get isPhoneNumber => attr == clerk.UserAttribute.phoneNumber;

  bool get isOptional => isRequired == false;

  String get title => attr.toString().replaceAll('_', ' ').capitalized;
}
