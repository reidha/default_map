library default_map;

import 'dart:collection';

class DefaultMap<K, V> with MapMixin<K, V> {
  // Inspired by https://stackoverflow.com/a/61198678

  final Map<K, V> _map = <K, V>{};
  late V Function() _ifAbsent;

  V Function() _generateIfAbsent() {
    if (V == int) {
      return () => 0 as V;
    } else if (V == double) {
      return () => 0.0 as V;
    } else if (V == String) {
      return () => '' as V;
    } else if (V == bool) {
      return () => false as V;
    }

    String vString = V.toString();
    if (vString.startsWith('Map')) {
      switch (vString) {
        case 'Map<int, int>':
          return () => <int, int>{} as V;
        case 'Map<int, double>':
          return () => <int, double>{} as V;
        case 'Map<int, String>':
          return () => <int, String>{} as V;
        case 'Map<int, bool>':
          return () => <int, bool>{} as V;
        case 'Map<String, int>':
          return () => <String, int>{} as V;
        case 'Map<String, double>':
          return () => <String, double>{} as V;
        case 'Map<String, String>':
          return () => <String, String>{} as V;
        case 'Map<String, bool>':
          return () => <String, bool>{} as V;
        default:
          return () => {} as V;
      }
    } else if (vString.startsWith('List')) {
      switch (vString) {
        case 'List<int>':
          return () => <int>[] as V;
        case 'List<double>':
          return () => <double>[] as V;
        case 'List<String>':
          return () => <String>[] as V;
        case 'List<bool>':
          return () => <bool>[] as V;
        default:
          return () => [] as V;
      }
    }

    throw UnsupportedError("Have to specify `ifAbsent`");
  }

  /// `ifAbsent`
  /// Function to generate a default value.
  /// You have to specify this unless `V` is included below.
  /// `int`, `double`, `String`, `bool`, `List<int>`, `List<double>`, `List<String>`, `List<bool>`,
  /// `Map<int, int>`, `Map<int, double>`, `Map<int, String>`, `Map<int, bool>`,
  /// `Map<String, int>`, `Map<String, double>`, `Map<String, String>`, `Map<String, bool>`
  DefaultMap([V Function()? ifAbsent]) {
    if (ifAbsent == null) {
      _ifAbsent = _generateIfAbsent();
    } else {
      _ifAbsent = ifAbsent;
    }
  }

  @override
  V operator [](Object? key) => _map.putIfAbsent(key as K, _ifAbsent);

  @override
  void operator []=(K key, V value) => _map[key] = value;

  @override
  void clear() => _map.clear();

  @override
  Iterable<K> get keys => _map.keys;

  @override
  V? remove(Object? key) => _map.remove(key);
}
