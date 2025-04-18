/// Container for errors encountered during Clerk auth(entication|orization)
///
class ClerkAuthException implements Exception {
  /// Construct an [ClerkAuthException]
  ClerkAuthException({
    required this.message,
    this.statusCode,
    this.serverCodeList = const [],
    this.substitution,
  });

  /// HTTP status code of the response, if exists
  final int? statusCode;

  /// List of backend error codes
  final Iterable<String> serverCodeList;

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
