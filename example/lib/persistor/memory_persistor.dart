import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart';

class MemoryPersistor implements Persistor {
  final Map<String, String> _tokens = {};

  @override
  FutureOr<void> delete(String key) {
    print('MemoryPersistor DELETE $key');
    _tokens.remove(key);
  }

  @override
  FutureOr<T?> read<T>(String key) {
    final result = _tokens[key];
    print('MemoryPersistor READ $key -> $result');
    return result as T?;
  }

  @override
  FutureOr<void> write<T>(String key, T value) {
    print('MemoryPersistor WRITE $key -> \n$value');
    _tokens[key] = value as String;
  }
}
