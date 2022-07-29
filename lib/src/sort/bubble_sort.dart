part of pop_dart.sort;

/// Sort [list] according to [comparator] using bubble sort.
///
/// TODO: improve readme, big O time and space complexity, pros and cons, etc...
///
void bubbleSort<E>(List<E> list, [Comparator<E>? compare]) {
  final comp = safeCompare(compare);
  final length = list.length;
  for (int j = 0; j < length - 1; ++j) {
    for (int i = 0; i < length - 1 - j; ++i) {
      if (comp(list[i], list[i + 1]) > 0) {
        list.swap(i + 1, i);
      }
    }
  }
}

/// Sorter class that delegates sorting to [bubbleSort].
class BubbleSorter implements Sorter {
  /// Create [BubbleSorter].
  const BubbleSorter();

  @override
  sort<E>(list, [Comparator<E>? compare]) => bubbleSort(list, compare);
}

/// Add [bubbleSort] method to [List].
extension BubbleSortExtension<E> on List<E> {
  /// Sort this according to [compare] using bubble sort.
  void bubbleSort([Comparator<E>? compare]) {
    sortWith(const BubbleSorter(), compare);
  }
}
