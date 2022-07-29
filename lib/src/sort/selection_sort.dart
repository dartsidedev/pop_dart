part of pop_dart.sort;

/// Sort [list] according to [comparator] using bubble sort.
///
/// TODO: improve readme, big O time and space complexity, pros and cons, etc...
///
void selectionSort<E>(List<E> list, [Comparator<E>? compare]) {
  final comp = safeCompare(compare);
  final length = list.length;
  for (int j = 0; j < length - 1; ++j) {
    var smallest = j;
    for (int i = j; i < length; ++i) {
      if (comp(list[i], list[smallest]) < 0) {
        smallest = i;
      }
    }
    _swap(list, j, smallest);
  }
}


/// Sorter class that delegates sorting to [selectionSort].
class SelectionSorter implements Sorter {
  /// Create [SelectionSorter].
  const SelectionSorter();

  @override
  sort<E>(list, [Comparator<E>? compare]) => selectionSort(list, compare);
}

/// Add [selectionSort] method to [List].
extension SelectionSortExtension<E> on List<E> {
  /// Sort this according to [compare] using selection sort.
  void selectionSort([Comparator<E>? compare]) {
    sortWith(const SelectionSorter(), compare);
  }
}