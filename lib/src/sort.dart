import 'dart:math' as math;
import 'package:meta/meta.dart';

/// Change elements with index [i] and [j] in [list].
void _swap<E>(List<E> list, int i, int j) {
  final t = list[j];
  list[j] = list[i];
  list[i] = t;
}

/// Sort [list] according to [comparator]using bubble sort.
///
/// Complexity: time avg, worst, space.
///
/// Sorting description
void bubble<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {
  final Comparator<E> c = comparator ?? Comparable.compare;
  for (int j = 0; j < list.length - 1; ++j) {
    for (int i = 0; i < list.length - 1 - j; ++i) {
      if (c(list[i], list[i + 1]) > 0) {
        _swap(list, i + 1, i);
      }
    }
  }
}

void selection<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {
  final Comparator<E> c = comparator ?? Comparable.compare;
  for (int j = 0; j < list.length - 1; ++j) {
    int smallest = j;
    for (int i = j; i < list.length; ++i) {
      if (c(list[i], list[smallest]) < 0) smallest = i;
    }
    _swap(list, j, smallest);
  }
}

/// Sort [list] using the [comparator] in place using insertion sort.
///
/// [comparator] is optional, defaults to [Comparable.compare] if omitted.
///
/// Time complexity:
/// * average case: 0(n^2)
/// * best case - the elements are already sorted: 0(n)
/// * worst case - the elements are sorted in the reverese order: 0(n^2)
/// where n is the number of elements in the list.
///
/// Advantages:
/// * performs well on already substantially sorted lists
/// * usually performs better than [bubble] and [selection] sort
/// * O(1) additional memory space
void insertion<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {
  final Comparator<E> c = comparator ?? Comparable.compare;
  for (int i = 1; i < list.length; ++i) {
    int j = i - 1;
    while (j + 1 > 0 && (c(list[j + 1], list[j]) < 0)) {
      _swap(list, j + 1, j);
      --j;
    }
  }
}

void merge<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
void quick<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
void radix<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
void heap<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}




void tree<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
void counting<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
void bucket<E>(
  List<E> list, {
  Comparator<E> comparator,
}) {}
