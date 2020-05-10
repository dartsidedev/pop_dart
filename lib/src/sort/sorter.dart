/// Interface for accessing sorting algorithms.
abstract class Sorter<E> {
  /// Sort elements of [list] using [comparator].
  ///
  /// In case [comparator] is omitted, [Comparable.compare]
  /// will be used for comparing and sorting the list elements.
  sort(List<E> list, {Comparator<E> comparator});
}

