import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';

import 'package:default_map/default_map.dart';

void main() {
  test('V = String', () {
    final DefaultMap<int, String> m = DefaultMap<int, String>();
    m[1] = 'one';
    expect(m[1], 'one');
    expect(m[2], '');
  });
  test('V = int', () {
    final DefaultMap<String, int> m = DefaultMap<String, int>();
    m['one'] = 1;
    expect(m['one'], 1);
    expect(m['zero'], 0);
  });
  test('V = List<int>', () {
    final DefaultMap<String, List<int>> m = DefaultMap<String, List<int>>();
    m['1'].add(1);
    m['1'].add(2);
    expect(m['1'], [1, 2]);
    expect(m['2'], []);
  });

  test('V = HashMap<int, int> && give ifAbsent argument', () {
    final DefaultMap<int, HashMap<int, int>> m =
        DefaultMap<int, HashMap<int, int>>(() => HashMap<int, int>());
    m[1][1] = 1;
    expect(m[1], {1: 1});
    expect(m[2], {});
  });

  test('V = double - Remove', () {
    final DefaultMap<int, double> m = DefaultMap<int, double>();
    m[1] = 1.2;
    expect(m.remove(1), 1.2);
    expect(m[1], 0);
    expect(m.remove(2), null);
  });

  test('V = bool', () {
    final DefaultMap<String, bool> m = DefaultMap<String, bool>();
    m.containsKey(1);
    m['one'] = true;
    expect(m['one'], true);
    expect(m['two'], false);
  });

  test('V = Map<String, bool>', () {
    final DefaultMap<String, Map<String, bool>> m =
        DefaultMap<String, Map<String, bool>>();
    m['one']['one'] = true;
    expect(m['one'], {'one': true});
    expect(m['two'], {});
  });

  test('V = List', () {
    final DefaultMap<int, List> m = DefaultMap<int, List>();
    m[0].add(1);
    m[0].add('test');
    m[0].add(false);
    expect(m[0], [1, 'test', false]);
    expect(m[100], []);
  });
}
