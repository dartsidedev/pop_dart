import 'package:test/test.dart';

import 'package:pop_dart/sort.dart' as sort;

main() {
  group('sort', () {
    group('a simple integer list using', () {
      List<int> getInitialIntList() => [6, 4, 1, 9, 5, 9, 2, 3, 5, 1, 8, 6, 3];

      expectSortedList(List<int> list) {
        for (int i = 0; i < list.length - 1; i++)
          expect(list[i], lessThanOrEqualTo(list[i + 1]));
      }

      List<int> list;

      setUp(() => list = getInitialIntList());

      tearDown(() => expectSortedList(list));
      test('selection sort', () => sort.selection(list));

      test('bubble sort', () => sort.bubble(list));

      test('insertion sort', () => sort.insertion(list));

      test('shell sort', () => sort.shell(list));
    });
  });

  group('shell: find gaps', () {
    test('shell gap sequence: 7', () {
      expect(sort.findGaps(7, sort.GapSequence.shell), equals([3, 1]));
    });
    test('shell gap sequence: 15', () {
      expect(sort.findGaps(15, sort.GapSequence.shell), equals([7, 3, 1]));
    });
    test('shell gap sequence: 16', () {
      expect(sort.findGaps(16, sort.GapSequence.shell), equals([8, 4, 2, 1]));
    });
    test('shell gap sequence: 17', () {
      expect(sort.findGaps(17, sort.GapSequence.shell), equals([3, 1]));
    });
  });
}
