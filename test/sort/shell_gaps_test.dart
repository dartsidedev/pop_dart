import 'package:test/test.dart';
import 'package:pop_dart/src/sort/shell_gaps.dart';

main() {
  group('findGaps', () {
    group('${GapSequence.shell}', () {
      final shell = (int length) => findGaps(length, GapSequence.shell);
      test('7', () => expect(shell(7), equals([3, 1])));
      test('15', () => expect(shell(15), equals([7, 3, 1])));
      test('16', () => expect(shell(16), equals([8, 4, 2, 1])));
      test('17', () => expect(shell(17), equals([8, 4, 2, 1])));
    });
    group('${GapSequence.frankLazarus}', () {
      final fal = (int length) => findGaps(length, GapSequence.frankLazarus);
      test('7', () => expect(fal(7), equals([3, 1])));
      test('15', () => expect(fal(15), equals([7, 3, 1])));
      test('16', () => expect(fal(16), equals([9, 5, 3, 1])));
      test('17', () => expect(fal(17), equals([9, 5, 3, 1])));
    });

    group('GapSequence.hibbard', () {
      final hibbard = (int length) => findGaps(length, GapSequence.hibbard);
      test('8', () => expect(hibbard(8), equals([7, 3, 1])));
    });

    group('GapSequence.papernovStasevich', () {
      final ps = (int length) => findGaps(length, GapSequence.papernovStasevich);
      test('66', () => expect(ps(66), equals([33, 17, 9, 5, 3, 1])));
    });

    group('prattKnuth', () {
      final pk = (int length) => findGaps(length, GapSequence.prattKnuth);
      test('81', () => expect(pk(81), equals([40, 13, 4, 1])));
    });

    group('sw82', () {
      final sw82 = (int length) => findGaps(length, GapSequence.sedgewick82);
      test('78', () => expect(sw82(78), equals([77, 23, 8, 1])));
    });

    group('sw86', () {
      final sw86 = (int length) => findGaps(length, GapSequence.sedgewick86);
      test('110', () => expect(sw86(110), equals([77, 23, 8, 1])));
    });

    group('tok', () {
      final tok = (int length) => findGaps(length, GapSequence.tokuda);
      test('103', () => expect(tok(104), equals([103, 46, 20, 9, 4, 1])));
    });
  });
}