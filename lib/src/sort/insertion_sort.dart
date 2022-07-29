part of pop_dart.sort;

/// Sort [list] according to [comparator] using insertion sort.
///
/// TODO: improve readme, big O time and space complexity, pros and cons, etc...
///
void insertionSort<E>(List<E> list, [Comparator<E>? compare]) {
  final comp = safeCompare(compare);
  for (int i = 1; i < list.length; ++i) {
    int j = i - 1;
    while (j + 1 > 0 && (comp(list[j + 1], list[j]) < 0)) {
      _swap(list, j + 1, j);
      --j;
    }
  }
}

/// Sorter class that delegates sorting to [insertionSort].
class InsertionSorter implements Sorter {
  /// Create [InsertionSorter].
  const InsertionSorter();

  @override
  sort<E>(List<E> list, [Comparator<E>? compare]) =>
      insertionSort(list, compare);
}

/// Add [insertionSort] method to [List].
extension InsertionSortExtension<E> on List<E> {
  /// Sort this according to [compare] using insertion sort.
  void insertionSort([Comparator<E>? compare]) {
    sortWith(const InsertionSorter(), compare);
  }
}
