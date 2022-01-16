import 'dart:collection';

import 'package:default_map/default_map.dart';

void main() {
  final DefaultMap<int, int> m1 = DefaultMap<int, int>();
  final DefaultMap<int, HashMap<int, int>> m2 =
      DefaultMap<int, HashMap<int, int>>(() => HashMap<int, int>());
  final DefaultMap<int, List<int>> m3 = DefaultMap<int, List<int>>();

  m3[0].add(1);
  m3[1].add(2);
  m3[1].add(1);
}
