import 'package:pop_dart/pop_dart.dart';
import 'package:test/test.dart';

import 'package:pop_dart/sort.dart';

List<int> buildInts() {
  return [5, 2, 6, 7, 2, 6, 1, 9, -6, -9, 0, 0, 0, 17, 21, -1];
}

List<String> buildStrings() {
  return ['abba', 'cababa', '123', 'Abba', 'Banana', 'Qwerty', 'AsdAsd'];
}

const sortedInts = [-9, -6, -1, 0, 0, 0, 1, 2, 2, 5, 6, 6, 7, 9, 17, 21];
const sortedStrings = [
  '123',
  'Abba',
  'AsdAsd',
  'Banana',
  'Qwerty',
  'abba',
  'cababa'
];
const sortedStringsByLength = [
  '123',
  'abba',
  'Abba',
  'cababa',
  'Banana',
  'Qwerty',
  'AsdAsd',
];

Iterable<MapEntry<String, Sorter>> generateSorter() sync* {
  yield const MapEntry('bubble sort', BubbleSorter());
  yield const MapEntry('insertion sort', InsertionSorter());
  yield const MapEntry('selection sort', SelectionSorter());
  // yield const MapEntry('shell sort', ShellSorter());
  // yield const MapEntry(
  //   'shell sort with gap sequence',
  //   ShellSorter.withGapSequence(GapSequence.prattKnuth),
  // );
  // yield const MapEntry(
  //   'shell sort with custom gap sequence',
  //   ShellSorter.withCustomGapSequence([10, 3, 1]),
  // );
}

main() {
  group('sortWith extension', () {
    for (var s in generateSorter()) {
      final sortName = s.key;
      final sorter = s.value;

      test('sorts integers with $sortName', () {
        expect(buildInts()..sortWith(sorter), equals(sortedInts));
      });

      test('sorts strings with $sortName', () {
        expect(buildStrings()..sortWith(sorter), equals(sortedStrings));
      });

      test('sorts strings by length with $sortName', () {
        expect(
          buildStrings()..sortWith(sorter, (a, b) => a.length - b.length),
          equals(sortedStringsByLength),
        );
      });
    }
  });
}
