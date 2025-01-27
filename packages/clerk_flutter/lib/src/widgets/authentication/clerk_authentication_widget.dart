import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum _AuthState {
  signingIn,
  signingUp;

  bool get isSigningIn => this == signingIn;

  bool get isSigningUp => this == signingUp;

  _AuthState get nextState => values[(index + 1) % values.length];
}

/// The [ClerkAuthenticationWidget] renders a UI for signing users or up.
///
/// The functionality of the [ClerkAuthenticationWidget] is controlled by the instance settings you
/// specify in your Clerk Dashboard, such as sign-in and sign-ip options and social
/// connections. You can further customize you [ClerkAuthenticationWidget] by passing additional
/// properties.
///
@immutable
class ClerkAuthenticationWidget extends StatefulWidget {
  /// Constructs a new [ClerkAuthenticationWidget].
  const ClerkAuthenticationWidget({
    super.key,
    this.uiConfig = const ClerkMaterialUIConfig(),
  });

  /// The UI configuration to use for styling components.
  /// Defaults to [ClerkMaterialUIConfig] for backward compatibility.
  final ClerkUIConfig uiConfig;

  @override
  State<ClerkAuthenticationWidget> createState() =>
      _ClerkAuthenticationWidgetState();
}

class _ClerkAuthenticationWidgetState extends State<ClerkAuthenticationWidget>
    with ClerkTelemetryStateMixin {
  _AuthState _state = _AuthState.signingIn;

  void _toggle() => setState(() => _state = _state.nextState);

  @override
  Widget build(BuildContext context) {
    return ClerkUIProvider(
      config: widget.uiConfig,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 530.0),
        child: ClerkCard(
          topPortion: _TopPortion(state: _state),
          middlePortion: ClerkAuthBuilder(
            builder: (context, auth) {
              final env = auth.env;
              return Padding(
                padding: horizontalPadding32,
                child: Column(
                  children: [
                    if (env.hasOauthStrategies) //
                      Closeable(
                        closed: auth.isSigningIn || auth.isSigningUp,
                        child: const ClerkSSOPanel(),
                      ),
                    if (env.hasIdentificationStrategies) ...[
                      if (env.hasOauthStrategies) //
                        const Padding(
                          padding: verticalPadding24,
                          child: OrDivider(),
                        ),
                      Closeable(
                        closed: _state.isSigningIn == false,
                        child: const ClerkSignInPanel(),
                      ),
                      Closeable(
                        closed: _state.isSigningUp == false,
                        child: const ClerkSignUpPanel(),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
          bottomPortion: _BottomPortion(
            state: _state,
            onChange: _toggle,
          ),
        ),
      ),
    );
  }
}

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion({required this.state});

  final _AuthState state;

  @override
  Widget build(BuildContext context) {
    final display = ClerkAuth.displayConfigOf(context);
    final translator = ClerkAuth.translatorOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: verticalPadding32,
          child: Center(
            child: SizedBox.square(
              dimension: 32.0,
              child: display.logoUrl?.isNotEmpty == true
                  ? Image.network(display.logoUrl!)
                  : SvgPicture.asset(ClerkAssets.defaultOrganizationLogo,
                      package: 'clerk_flutter'),
            ),
          ),
        ),
        Padding(
          padding: horizontalPadding32,
          child: Text(
            translator.translate(
              state.isSigningIn ? 'Sign in to ###' : 'Sign up to ###',
              substitution: display.applicationName,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: context.clerkTitle,
          ),
        ),
        Padding(
          padding: horizontalPadding32 + bottomPadding24,
          child: Text(
            translator.translate(
              state.isSigningIn
                  ? 'Welcome back! Please sign in to continue'
                  : 'Welcome! Please fill in the details to get started',
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: context.clerkSubtitle,
          ),
        ),
      ],
    );
  }
}

@immutable
class _BottomPortion extends StatelessWidget {
  const _BottomPortion({required this.onChange, required this.state});

  final VoidCallback onChange;
  final _AuthState state;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalMargin12,
        Padding(
          padding: horizontalPadding32,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: state.isSigningIn
                      ? translator.translate("Don't have an account?")
                      : translator.translate('Already have an account?'),
                  style: context.clerkSubtitle,
                ),
                const WidgetSpan(child: SizedBox(width: 6)),
                TextSpan(
                  text: state.isSigningIn
                      ? translator.translate('Sign up')
                      : translator.translate('Sign in'),
                  style: context.clerkSubtitle
                      .copyWith(color: ClerkColors.darkJungleGreen),
                  recognizer: TapGestureRecognizer()..onTap = onChange,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalMargin12,
      ],
    );
  }
}
