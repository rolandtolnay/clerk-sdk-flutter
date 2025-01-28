/// Container for errors encountered during Clerk auth(entication|orization)
///
class ClerkAuthException implements Exception {
  /// Construct an [ClerkAuthException]
  ClerkAuthException({
    required this.message,
    this.statusCode,
    this.codeList = const [],
    this.substitution,
  });

  /// HTTP status code of the response, if exists
  final int? statusCode;

  /// List of backend error codes
  final Iterable<String> codeList;

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
}
