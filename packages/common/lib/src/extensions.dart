extension MapExtension on Map {
  Map<String, String> toStringMap() => map((k, v) => MapEntry(k.toString(), v.toString()));
}

extension StringExtension on String {
  bool _isUpper(int c) => c >= 0x41 && c <= 0x5a;
  bool _isNumeric(int c) => c >= 0x30 && c <= 0x39;
  bool _isAlphanum(int c) => _isUpper(c) || _isNumeric(c);

  String toSnakeCase({String separator = "_"}) {
    if (isEmpty) return this;

    final buffer = StringBuffer();
    for (final rune in runes) {
      if (_isUpper(rune)) {
        buffer.write(separator);
        buffer.writeCharCode(rune | 0x20);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  String get capitalized => this[0].toUpperCase() + substring(1);

  String get initials => toUpperCase()
      .split(' ')
      .where((t) => t.isNotEmpty && _isAlphanum(t.runes.first))
      .map((t) => t[0])
      .join();
}

extension ListExtension on List {
  void addOrReplaceAll<T, S>(Iterable<T> list, {S Function(T)? by}) {
    for (final item in list) {
      final identifier = by?.call(item) ?? item;
      switch (indexWhere((i) => (by?.call(i) ?? i) == identifier)) {
        case int idx when idx > -1:
          this[idx] = item;
        default:
          add(item);
      }
    }
  }
}
