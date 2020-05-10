
/// Supported gap sequences.
///
/// For more information, see:
/// * [Wikipedia > Shellsort > Gap sequences](https://en.wikipedia.org/wiki/Shellsort#Gap_sequences)
///
/// If you want to use your own gap sequence, see the [ShellSorter.withCustomGapSequence]
/// constructor, that lets you set arbitrary gaps for the sorting algorithm.
// TODO: Double check gap enum docs.
// TODO: We have aliases. Links, formulas, IDs...
// TODO: They have different worst-case time complexity.
// TODO: verify what I want the largest gaps to be...
// TODO: every damn loop is slightly different.
enum GapSequence {
  /// Shell's gap sequence:
  shell,
  frankLazarus,
  /// Hibbard's integer sequence 2^k - 1
  ///
  /// See https://oeis.org/A168604
  hibbard,
  /// Hibbard's integer sequence 2^k - 1
  ///
  /// See https://oeis.org/A168604
  a168604,
  /// Papernov and Stasevich' gap sequence 2^k + 1 (and 1)
  ///
  /// See https://oeis.org/A083318
  papernovStasevich,
  /// Papernov and Stasevich' gap sequence 2^k + 1 (and 1)
  ///
  /// See https://oeis.org/A083318
  a083318,
  /// Not implemented. pratt, smooth3 and a003586 are aliases of the same
  /// integer sequence.
  pratt,
  /// Not implemented. pratt, smooth3 and a003586 are aliases of the same
  /// integer sequence.
  smooth3,
  /// Not implemented. pratt, smooth3 and a003586 are aliases of the same
  /// integer sequence.
  a003586,
  /// (3 ^ k - 1)/2, less than ceil(N/3)
  prattKnuth,
  /// Same as prattKnuth
  a003462,
  /// Not implemented. incerpiSedgewickKnuth, a036569
  incerpiSedgewickKnuth,
  /// Not implemented. incerpiSedgewickKnuth, a036569
  a036569,
  /// Same: sedgewick82, a036562
  sedgewick82,
  /// Same: sedgewick82, a036562
  a036562,
  /// Not implemented: gonnetBaezaYates
  gonnetBaezaYates,
  /// Same: tokuda, a108870
  tokuda,
  /// Same: tokuda, a108870
  a108870,
  /// Same: ciura, A102549
  ciura,
  /// Same: ciura, A102549
  a102549,
  /// Same a033622 sedgewick86
  sedgewick86,
  /// Same a033622 sedgewick86
  a033622,
}

/// Generate gaps for an array with [length] items using [gapSequence] method.
List<int> findGaps(int length, GapSequence gapSequence) {
  // Some sequences are not implemented. I'm just not sure anyone would ever use them.
  switch(gapSequence) {
    case GapSequence.shell:
      return _shellGaps(length);
    case GapSequence.frankLazarus:
      return _frankLazarusGaps(length);
    case GapSequence.hibbard:
    case GapSequence.a168604:
      return _hibbardGaps(length);
    case GapSequence.papernovStasevich:
    case GapSequence.a083318:
      return _papernovStasevichGaps(length);
    case GapSequence.pratt:
    case GapSequence.smooth3:
    case GapSequence.a003586:
      throw UnimplementedError();
    case GapSequence.prattKnuth:
    case GapSequence.a003462:
      return _prattKnuth(length);
    case GapSequence.incerpiSedgewickKnuth:
    case GapSequence.a036569:
      throw UnimplementedError();
    case GapSequence.sedgewick82:
    case GapSequence.a036562:
      return _sedgewick82Gaps(length);
    case GapSequence.gonnetBaezaYates:
      throw UnimplementedError();
    case GapSequence.ciura:
    case GapSequence.a102549:
      return _ciuraGaps(length);
    case GapSequence.tokuda:
    case GapSequence.a108870:
      return _tokuda(length);
    case GapSequence.sedgewick86:
    case GapSequence.a033622:
      return _sedgewick86(length);
  }
  throw 'unexpected gap sequence';
}

List<int> _shellGaps(int length) {
  final List<int> gaps = [];
  int pow2k = 1;
  int gap;
  while (pow2k < length) {
    pow2k *= 2;
    gap = (length / pow2k).floor();
    if (gap >= 1) gaps.add(gap);
  }
  return gaps;
}

List<int> _frankLazarusGaps(int length) {
  final List<int> gaps = [];
  int pow2k = 1;
  int gap;
  do {
    pow2k *= 2;
    gap = 2 * (length / pow2k).floor() + 1;
    if (gap < length) gaps.add(gap); 
  } while (gap > 1);
  return gaps;
}

List<int> _hibbardGaps(int length) {
  final List<int> gaps = [];
  int pow2k = 1;
  int gap = -1;
  // Not sure what is the appropriate stopping point, length or half length?
  while (gap < length) {
    pow2k *= 2;
    gap = pow2k - 1;
    gaps.insert(0, gap);
  }
  return gaps;
}

List<int> _papernovStasevichGaps(int length) {
  final List<int> gaps = [];
  int pow2k = 1;
  // If I took 30 seconds to think about this, there's probably
  // a cleaner way. Right now, I just don't care.
  int gap = -1;
  // Not sure what is the appropriate stopping point, length or half length?
  gaps.add(1);
  while (gap < length) {
    pow2k *= 2;
    gap = pow2k + 1;
    gaps.insert(0, gap);
  }
  return gaps;
}


List<int> _prattKnuth(int length) {
  final List<int> gaps = [];
  int thirdLength = (length / 3).ceil();
  int gap = -1;
  int pow3k = 1;
  do {
    pow3k *= 3;
    gap = (pow3k - 1) ~/ 2;
    gaps.insert(0, gap);
  } while (gap < thirdLength);
  return gaps;
}

List<int> _sedgewick82Gaps(int length) {
  final List<int> gaps = [1];
  int gap = 1;
  int pow4k = 1;
  int pow2k = 1;
  while (true) {
    pow4k *= 4;
    gap = pow4k + 3 * pow2k + 1;
    if (gap < length) gaps.insert(0, gap); else break;
    pow2k *= 2;
  }
  return gaps;
}

List<int> _sedgewick86(int length) {
 TODO;
}

List<int> _ciuraGaps(int length) {
  // Again, half length, length, 75%? Maybe stack exchange could help...
  return [1, 4, 10, 23, 57, 132, 301, 701].where((g) => g < length);
}

List<int> _tokuda(int length) {
  final List<int> gaps = [1];
  int pow9k1 = 9;
  int pow4k = 1;
  int gap;
  while (true) {
    pow4k *= 4;
    pow9k1 *= 9;
    gap = (0.2 * (pow9k1 / pow4k - 4)).ceil();
    if (gap < length) gaps.insert(0, gap); else break;
  }
  return gaps;
}