import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations.dart';

/// Function that performs localization
typedef LocalizedMessage = String Function(ClerkSdkLocalizations localizations);

/// An extension class to enable localization of [clerk.AuthError]
///
extension ClerkAuthErrorExtension on clerk.ClerkAuthException {
  /// Allow localization of an [clerk.AuthError]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (code) {
      clerk.AuthErrorCode.noStageForStatus =>
        localizations.noStageForStatus(argument.toString()),
      clerk.AuthErrorCode.noSessionTokenRetrieved =>
        localizations.noSessionTokenRetrieved,
      clerk.AuthErrorCode.noAssociatedStrategy =>
        localizations.noAssociatedStrategy(argument.toString()),
      clerk.AuthErrorCode.passwordMatchError =>
        localizations.passwordAndPasswordConfirmationMustMatch,
      clerk.AuthErrorCode.jwtPoorlyFormatted =>
        localizations.jwtPoorlyFormatted(argument.toString()),
      clerk.AuthErrorCode.actionNotTimely => localizations.actionNotTimely,
      clerk.AuthErrorCode.noSessionFoundForUser =>
        localizations.noSessionFoundForUser(argument.toString()),
      clerk.AuthErrorCode.noSuchFirstFactorStrategy =>
        localizations.noSuchFirstFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.noSuchSecondFactorStrategy =>
        localizations.noSuchSecondFactorStrategy(argument.toString()),
      clerk.AuthErrorCode.signInError =>
        localizations.signInError(argument.toString()),
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.EnrollmentMode]
///
extension ClerkEnrollmentTypeExtension on clerk.EnrollmentMode {
  /// Allow localization of a "via [clerk.EnrollmentMode]" message
  String viaInvitationMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation =>
        localizations.viaManualInvitation,
      clerk.EnrollmentMode.automaticInvitation =>
        localizations.viaAutomaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion =>
        localizations.viaAutomaticSuggestion,
    };
  }

  /// Allow localization of a [clerk.EnrollmentMode]
  String localizedName(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.EnrollmentMode.manualInvitation => localizations.manualInvitation,
      clerk.EnrollmentMode.automaticInvitation =>
        localizations.automaticInvitation,
      clerk.EnrollmentMode.automaticSuggestion =>
        localizations.automaticSuggestion,
    };
  }
}

/// An extension class to enable localization of [clerk.Status]
///
extension ClerkStatusLocalization on clerk.Status {
  /// Allow localization of an [clerk.Status]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Status.abandoned => localizations.abandoned,
      clerk.Status.active => localizations.active,
      clerk.Status.complete => localizations.complete,
      clerk.Status.expired => localizations.expired,
      clerk.Status.failed => localizations.failed,
      clerk.Status.missingRequirements => localizations.missingRequirements,
      clerk.Status.needsFirstFactor => localizations.needsFirstFactor,
      clerk.Status.needsIdentifier => localizations.needsIdentifier,
      clerk.Status.needsSecondFactor => localizations.needsSecondFactor,
      clerk.Status.pending => localizations.pending,
      clerk.Status.transferable => localizations.transferable,
      clerk.Status.unverified => localizations.unverified,
      clerk.Status.verified => localizations.verified,
      _ => title,
    };
  }
}

/// An extension class to enable localization of [clerk.Strategy]
///
extension ClerkStrategyLocalization on clerk.Strategy {
  /// Allow localization of an [clerk.Strategy]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Strategy.emailAddress => localizations.emailAddress,
      clerk.Strategy.phoneNumber => localizations.phoneNumber,
      clerk.Strategy.username => localizations.username,
      _ => toString(),
    };
  }
}

/// An extension class to enable localization of [clerk.Field]
///
extension ClerkFieldLocalization on clerk.Field {
  /// Allow localization of an [clerk.Field]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.Field.emailAddress => localizations.emailAddress,
      clerk.Field.phoneNumber => localizations.phoneNumber,
      clerk.Field.username => localizations.username,
      _ => name,
    };
  }
}

/// An extension class to enable localization of [clerk.UserAttribute]
///
extension ClerkUserAttributeLocalization on clerk.UserAttribute {
  /// Allow localization of an [clerk.UserAttribute]
  String localizedMessage(ClerkSdkLocalizations localizations) {
    return switch (this) {
      clerk.UserAttribute.emailAddress => localizations.emailAddress,
      clerk.UserAttribute.phoneNumber => localizations.phoneNumber,
      clerk.UserAttribute.username => localizations.username,
      clerk.UserAttribute.firstName => localizations.firstName,
      clerk.UserAttribute.lastName => localizations.lastName,
      clerk.UserAttribute.password => localizations.password,
      clerk.UserAttribute.passwordConfirmation =>
        localizations.passwordConfirmation,
      clerk.UserAttribute.web3Wallet => localizations.web3Wallet,
      clerk.UserAttribute.authenticatorApp => localizations.authenticatorApp,
      clerk.UserAttribute.backupCode => localizations.backupCode,
      clerk.UserAttribute.passkey => localizations.passkey,
    };
  }
}

/// An extension class for [String]
///
extension StringExt on String {
  /// A method that takes a list of pre-translated [items] e.g.
  /// \['first', 'second', 'third'\] and returns a textual representation
  /// of its contents as alternatives e.g. "first, second or third"
  ///
  /// [connector] can be overridden, and a [prefix] can be prepended. Both
  /// should already be translated as required.
  ///
  /// This method should be overridden for languages where this format does not
  /// provide the correct representation for alternates
  ///
  static String alternatives(
    List<String> items, {
    required String connector,
    String? prefix,
  }) {
    if (items.isEmpty) {
      return '';
    }

    final buf = StringBuffer();

    if (prefix case String prefix) {
      buf.write(prefix);
      buf.writeCharCode(0x20);
    }

    buf.write(items.first);

    for (int i = 1; i < items.length - 1; i++) {
      buf.write(', ');
      buf.write(items[i]);
    }

    if (items.length > 1) {
      buf.write(' $connector ');
      buf.write(items.last);
    }

    return buf.toString();
  }
}
