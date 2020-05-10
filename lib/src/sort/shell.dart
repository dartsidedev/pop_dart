import './sorter.dart';
import './shell_gaps.dart';

class ShellSorter<E> implements Sorter {

  final List<int> _gaps;

  final GapSequence _gapSequence;
  
  /// Create shell sorter.
  ///
  ///  
  const ShellSorter(): _gapSequence = GapSequence.shell, _gaps = null;

  /// Create a shell shorter with supported [gapSequence].
  ///
  /// For a list of supported gap sequences, see [GapSequence]
  const ShellSorter.withGapSequence(GapSequence gapSequence): _gapSequence = gapSequence, _gaps = null;

  /// Create a shell sorter with a custom gap sequence.
  ///
  /// A set of common gap sequences are supported by the
  /// [ShellSorter.withGapSequence] constructor. The question
  /// of deciding which gap sequence to use is difficult, so
  /// [ShellSorter.withCustomGapSequence] enables setting a custom
  /// gap sequence which you could use in case you benchmarked sorting
  /// for your data set and use case and found that [gaps] perform better
  /// than any of the gaps supported by the package.
  ///
  /// A few things to keep in mind while selecting the gap sequence:
  /// * Too few gaps slow down the passes, too many gaps produces overhead.
  /// * Every gap sequence that contains 1 yields a correct sort.
  ShellSorter.withCustomGapSequence(List<int> gaps): _gapSequence = null, _gaps = gaps, assert(gaps.last == 1, 'Correct sorting can only be guaranteed if the gap sequence contains 1.');

  @override
  sort(List list, {Comparator<E> comparator}) {
    final Comparator<E> c = comparator ?? Comparable.compare;
    final gaps = _gaps ?? findGaps(list.length, _gapSequence);
    for (int g = 0; g < gaps.length; ++g) {
      int gap = gaps[g];
      for (int i = gap; i < list.length; ++i) {
        E t = list[i];
        int j = i;
        while (j >= gap && c(list[j - gap], t) > 0) {
          list[j] = list[j - gap];
          j -= gap;
        }
        list[j] = t;
      }
    }
  }
}
