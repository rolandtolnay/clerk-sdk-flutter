import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

/// Based on `DefaultPersistor` from [persistor.dart](https://github.com/rolandtolnay/clerk-sdk-flutter/blob/develop/packages/clerk_auth/lib/src/clerk_auth/persistor.dart)
class FilePersistor implements Persistor {
  FilePersistor._(Directory storageDirectory)
      : _cacheFile = File('${storageDirectory.path}/$_filename');

  static FilePersistor? _instance;

  /// Create and initialise a [FilePersistor]
  static Future<FilePersistor> create({
    required Directory storageDirectory,
  }) async {
    if (_instance is! FilePersistor) {
      _instance = FilePersistor._(storageDirectory);
      await _instance!._initialize();
    }
    return _instance!;
  }

  static const _writeDelay = Duration(milliseconds: 100);
  static const _filename = 'clerk_sdk.json';

  final File _cacheFile;

  final _cache = <String, dynamic>{};
  Timer? _timer;

  Future<void> _initialize() async {
    try {
      if (_cacheFile.existsSync()) {
        final data = await _cacheFile.readAsString();
        _cache.addAll(json.decode(data) as Map<String, dynamic>);
      }
      print('FilePersistor initialized with ${_cache.length} items');
    } on FormatException catch (_) {
      // if we can't decode the json file then we'll delete it and start over
      _cacheFile.deleteSync();
    }
  }

  @override
  FutureOr<T?> read<T>(String key) {
    final result = _cache[key];
    print('FilePersistor READ $key -> $result');
    return result;
  }

  @override
  FutureOr<void> write<T>(String key, T value) {
    print('FilePersistor WRITE $key -> \n$value');
    _cache[key] = value;
    _save();
  }

  @override
  FutureOr<void> delete(String key) {
    print('FilePersistor DELETE $key');
    if (_cache.containsKey(key)) {
      _cache.remove(key);
      _save();
    }
  }

  void _save() {
    _timer?.cancel();
    _timer = Timer(_writeDelay, () {
      final data = json.encode(_cache);
      _cacheFile.writeAsString(data);
    });
  }
}
