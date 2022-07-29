import 'package:test/test.dart';
import 'package:pop_dart/sort.dart';

main() {
  group('findGaps', () {
    group('${GapSequence.shell}', () {
      final gs = (int length) => findGaps(length, GapSequence.shell);
      test('7', () => expect(gs(7), equals([3, 1])));
      test('15', () => expect(gs(15), equals([7, 3, 1])));
      test('16', () => expect(gs(16), equals([8, 4, 2, 1])));
      test('17', () => expect(gs(17), equals([8, 4, 2, 1])));
    });
    group('${GapSequence.frankLazarus}', () {
      final gs = (int length) => findGaps(length, GapSequence.frankLazarus);
      test('7', () => expect(gs(7), equals([3, 1])));
      test('15', () => expect(gs(15), equals([7, 3, 1])));
      test('16', () => expect(gs(16), equals([9, 5, 3, 1])));
      test('17', () => expect(gs(17), equals([9, 5, 3, 1])));
    });

    group('${GapSequence.hibbard}', () {
      final gs = (int length) => findGaps(length, GapSequence.hibbard);
      test('8', () => expect(gs(8), equals([7, 3, 1])));
    });

    group('${GapSequence.papernovStasevich}', () {
      final gs =
          (int length) => findGaps(length, GapSequence.papernovStasevich);
      test('66', () => expect(gs(66), equals([33, 17, 9, 5, 3, 1])));
    });

    group('${GapSequence.prattKnuth}', () {
      final gs = (int length) => findGaps(length, GapSequence.prattKnuth);
      test('81', () => expect(gs(81), equals([40, 13, 4, 1])));
    });

    group('${GapSequence.sedgewick82}', () {
      final gs = (int length) => findGaps(length, GapSequence.sedgewick82);
      test('78', () => expect(gs(78), equals([77, 23, 8, 1])));
    });

//    group('sw86', () {
//      final sw86 = (int length) => findGaps(length, GapSequence.sedgewick86);
//      test('110', () => expect(sw86(110), equals([77, 23, 8, 1])));
//    });

    group('${GapSequence.tokuda}', () {
      final gs = (int length) => findGaps(length, GapSequence.tokuda);
      test('104', () => expect(gs(104), equals([103, 46, 20, 9, 4, 1])));
    });
  });
}
