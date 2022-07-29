
class ChainMap<K, V> implements Map<K, V> {
  ChainMap(this._maps);

  final List<Map<K, V>> _maps;

  @override
  V? operator [](Object? key) {
    // TODO: implement []
    throw UnimplementedError();
  }

  @override
  void operator []=(K key, V value) {
    // TODO: implement []=
  }

  @override
  void addAll(Map<K, V> other) {
    // TODO: implement addAll
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    // TODO: implement addEntries
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  bool containsKey(Object? key) {
    // TODO: implement containsKey
    throw UnimplementedError();
  }

  @override
  bool containsValue(Object? value) {
    // TODO: implement containsValue
    throw UnimplementedError();
  }

  @override
  // TODO: implement entries
  Iterable<MapEntry<K, V>> get entries => throw UnimplementedError();

  @override
  void forEach(void Function(K key, V value) action) {
    // TODO: implement forEach
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();

  @override
  // TODO: implement keys
  Iterable<K> get keys => throw UnimplementedError();

  @override
  // TODO: implement length
  int get length => throw UnimplementedError();

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    // TODO: implement putIfAbsent
    throw UnimplementedError();
  }

  @override
  V? remove(Object? key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    // TODO: implement removeWhere
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    // TODO: implement updateAll
  }

  @override
  // TODO: implement values
  Iterable<V> get values => throw UnimplementedError();
}