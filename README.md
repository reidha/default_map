[![pub package](https://img.shields.io/pub/v/default_map.svg)](https://pub.dev/packages/default_map)

`Map` that you can use like Python's collections.defaultdict

## Features

Specify the default value of `Map`. This `DefaultMap` will never return `null`.

## Usage

Simply instantiate `DefaultMap`.  

````dart
final DefaultMap<int, String> m = DefaultMap<int, String>();
    m[1] = 'one';
    print(m[1]); // 'one'
    print(m[2]); // ''
````

You may need to give an argument, `ifAbsent`, which is a function to defines the default value. In this case, the argument is `() => HashMap<int, int>()`, meaning an empty `HashMap<int, int>` is returned when keys don't exist.

````dart
    final DefaultMap<int, HashMap<int, int>> m =
        DefaultMap<int, HashMap<int, int>>(() => HashMap<int, int>());
    m[1][1] = 1;
    print(m[1]); // {1: 1}
    print(m[2]); // {} 
````

## Additional information
If your `V` in `DefaultMap<K, V>` is included below, you don't need to specify the default value (the argument, `ifAbsent`).

|`V`|Default value|
|----|----|
|`int`|`0`|
|`double`|`0.0`|
|`String`|`''`|
|`bool`|`false`|
|`List<int>`|`<int>[]`|
|`List<double>`|`<double>[]`|
|`List<String>`|`<String>[]`|
|`List<bool>`|`<bool>[]`|
|`Map<int, int>`|`<int, int>{}`|
|`Map<int, double>`|`<int, double>{}`|
|`Map<int, String>`|`<int, String>{}`|
|`Map<int, bool>`|`<int, bool>{}`|
|`Map<String, int>`|`<String, int>{}`|
|`Map<String, double>`|`<String, double>{}`|
|`Map<String, String>`|`<String, String>{}`|
|`Map<String, bool>`|`<String, bool>{}`|