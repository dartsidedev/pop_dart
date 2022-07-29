part of pop_dart.sort;

/// Interface for accessing sorting algorithms.
///
/// TODO: Clarify why the class is used instead of a simple function.
abstract class Sorter {
  const Sorter();

  /// Sort elements of [list] using [comparator].
  ///
  /// In case [comparator] is omitted, [Comparable.compare]
  /// will be used for comparing and sorting the list elements.
  sort<E>(
    List<E> list, [
    Comparator<E>? comparator,
    // bool reverse = false,
  ]);
}

extension Swap<E> on List<E> {
  /// Swap the [i]th and [j]th elements of the list.
  ///
  /// Arguments are pre-validated: [i] and [j] must be greater than or equal
  /// to 0 and less than [length].
  swap(int i, int j) {
    assert(0 <= i);
    assert(0 <= j);
    assert(i < length);
    assert(j < length);

    final temp = this[j];
    this[j] = this[i];
    this[i] = temp;
  }
}

/// Change elements with indices [i] and [j] in [list].
void _swap<E>(List<E> list, int i, int j) {
  final t = list[j];
  list[j] = list[i];
  list[i] = t;
}

int compareAny(dynamic a, dynamic b) {
  return Comparable.compare(a as Comparable, b as Comparable);
}

/// Return [comparator] if provided,
/// fallback to [Comparable.compare] if [comparator] is null or missing.
///
/// Useful for providing an optional [Comparator] for the sorting algorithms.
Comparator<E> safeCompare<E>([Comparator<E>? comparator]) {
  return comparator ?? compareAny;
}

/// Adds the [sortWith] method to the [List].
extension SortWithExtension<E> on List<E> {
  /// Sorts this list using the [sorter]'s sort algorithm
  /// according to the order specified by the [compare] function.
  ///
  /// Please also read the docs about the [List] [sort] method.
  void sortWith(
    Sorter sorter, [
    Comparator<E>? compare,
  ]) {
    sorter.sort(this, compare ?? compareAny);
  }
}
