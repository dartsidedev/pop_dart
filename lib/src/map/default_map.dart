part of pop_dart.map;

typedef ValueBuilder<V> = V Function();

ValueBuilder<V> _createSimpleValueBuilder<V>(V value) => () => value;

// ChainMap?? https://docs.python.org/3/library/collections.html

// https://github.com/dart-lang/sdk/issues/2643
class DefaultMap<K, V> implements Map<K, V> {
  // TODO: all constructors and stuff should support source
  DefaultMap(this._valueBuilder, [Map<K, V>? source])
      : this._map = source ?? {};

  DefaultMap.withValue(V value, [Map<K, V>? source])
      : this._map = source ?? {},
        this._valueBuilder = _createSimpleValueBuilder(value);

  // TODO: provide a way to get the map behind the scenes?
  // TODO: why need to have a func all if it's just a simple value?
  // TODO: fromEntries, fromX, ???

  static Map<K, bool> forBools<K>([Map<K, bool>? source]) =>
      DefaultMap<K, bool>.withValue(false, source);

  static Map<K, int> forInts<K>([Map<K, int>? source]) =>
      DefaultMap<K, int>.withValue(0, source);

  static Map<K, double> forDoubles<K>([Map<K, double>? source]) =>
      DefaultMap<K, double>.withValue(0, source);

  static Map<K, String> forStrings<K>([Map<K, String>? source]) =>
      DefaultMap<K, String>.withValue('', source);

  final Map<K, V> _map;

  final ValueBuilder<V> _valueBuilder;

  // TODO: return type: V or V?
  // check if works with nullable
  @override
  V operator [](Object? key) =>
      _map.containsKey(key) ? _map[key] as V : _valueBuilder();

  @override
  void operator []=(K key, V value) => _map[key] = value;

  @override
  void addAll(Map<K, V> other) => _map.addAll(other);

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) =>
      _map.addEntries(newEntries);

  @override
  Map<RK, RV> cast<RK, RV>() {
    // TODO: I'm not sure how to solve this reasonably
    throw UnimplementedError();
  }

  @override
  void clear() => _map.clear();

  @override
  bool containsKey(Object? key) => _map.containsKey(key);

  @override
  bool containsValue(Object? value) => _map.containsValue(value);

  @override
  Iterable<MapEntry<K, V>> get entries => _map.entries;

  @override
  void forEach(void Function(K key, V value) action) => _map.forEach(action);

  @override
  bool get isEmpty => _map.isEmpty;

  @override
  bool get isNotEmpty => _map.isNotEmpty;

  @override
  Iterable<K> get keys => _map.keys;

  @override
  int get length => _map.length;

  // TODO: should it return a DefaultMap? if not why not. if yes, why?
  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) =>
      _map.map(convert);

  @override
  V putIfAbsent(K key, V Function() ifAbsent) =>
      _map.putIfAbsent(key, ifAbsent);

  @override
  V? remove(Object? key) => _map.remove(key);

  @override
  void removeWhere(bool Function(K key, V value) test) =>
      _map.removeWhere(test);

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) =>
      _map.update(key, update, ifAbsent: ifAbsent);

  @override
  void updateAll(V Function(K key, V value) update) => _map.updateAll(update);

  @override
  Iterable<V> get values => _map.values;
}
