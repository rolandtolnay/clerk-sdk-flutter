/// Container for errors encountered during Clerk auth(entication|orization)
///
class ClerkAuthException implements Exception {
  /// Construct an [ClerkAuthException]
  ClerkAuthException({
    required this.message,
    this.statusCode,
    this.serverCodeList = const [],
    this.code,
    this.argument,
    this.substitution,
  });

  /// HTTP status code of the response, if exists
  final int? statusCode;

  /// List of backend error codes
  final Iterable<String> serverCodeList;

  /// The associated [AuthErrorCode]
  final AuthErrorCode? code;

  /// The associated [argument]
  final String? argument;

  /// The associated [message]
  final String message;

  /// A possible [substitution] within the message
  final String? substitution;

  @override
  String toString() {
    if (substitution case String substitution) {
      return message.replaceAll('###', substitution);
    }
    return message;
  }

  /// Returns a debug-friendly string representation of the exception
  /// including the message, error codes, status code and any substitution value
  String get debugDescription {
    return 'ClerkAuthException(message: $message, codeList: $serverCodeList, statusCode: $statusCode, substitution: $substitution)';
  }
}

/// Code to enable consuming apps to identify the error
enum AuthErrorCode {
  /// Server error response
  serverErrorResponse,

  /// Webview error response
  webviewErrorResponse,

  /// Error during sign-up flow
  signUpFlowError,

  /// Invalid Password
  invalidPassword,

  /// Type Invalid
  typeInvalid,

  /// No stage for status
  noStageForStatus,

  /// No session token retrieved
  noSessionTokenRetrieved,

  /// No strategy associated with type,
  noAssociatedStrategy,

  /// No code retrieval method associated with the strategy,
  noAssociatedCodeRetrievalMethod,

  /// Password and password confirmation must match
  passwordMatchError,

  /// JWT poorly formatted
  jwtPoorlyFormatted,

  /// Awaited user action not completed in required timeframe
  actionNotTimely,

  /// No session found for user
  noSessionFoundForUser,

  /// Unsupported strategy for first factor
  noSuchFirstFactorStrategy,

  /// Unsupported strategy for second factor
  noSuchSecondFactorStrategy,

  /// Unsupported Sign-in attempt
  signInError,
}
