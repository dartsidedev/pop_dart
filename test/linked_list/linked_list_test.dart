import 'package:pop_dart/linked_list.dart';
import 'package:test/test.dart';

void main() {
  group(LinkedList, () {
    test('can add and remove', () {
      final linkedList = LinkedList<int>();

      expect(linkedList, hasLength(0));
      expect(linkedList, isEmpty);

      linkedList
        ..addFirst(3)
        ..addFirst(2)
        ..addFirst(1);

      expect(linkedList, hasLength(3));
      expect(linkedList, isNotEmpty);

      expect(linkedList.removeFirst(), 1);
      expect(linkedList.removeFirst(), 2);
      expect(linkedList.removeFirst(), 3);

      expect(linkedList, hasLength(0));
      expect(linkedList, isEmpty);
    });

    test('remove throws', () {
      final linkedList = LinkedList<int>();
      linkedList
        ..addFirst(1)
        ..removeFirst();

      expect(() => linkedList.removeFirst(), throwsStateError);
    });

    test('map', () {
      final stringsLinkedList = LinkedList<String>();
      stringsLinkedList
        ..addFirst('1')
        ..addFirst('2')
        ..addFirst('3');
      expect([...stringsLinkedList.map(int.parse)], [3, 2, 1]);
    });

    test('add', () {
      final linkedList = LinkedList<int>();
      linkedList
        ..add(1)
        ..add(2)
        ..add(3)
        ..addFirst(0);
      expect(linkedList, hasLength(4));
      final list = linkedList.toList();
      expect(list, [0, 1, 2, 3]);
    });

    test('addAll', () {
      final linkedList = LinkedList<int>();
      linkedList
        ..add(1)
        ..addFirst(0)
        ..addAll([2, 3, 4])
        ..addFirst(-1)
        ..add(5)
        ..addAll([6, 7, 8]);
      expect(linkedList, hasLength(10));
      final list = linkedList.toList();
      expect(list, [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8]);
    });
    
    test('addAll with empty', () {
      final linkedList = LinkedList<int>();
      linkedList
        ..addAll([1, 2, 3])
        ..addFirst(0)
        ..add(4);
      expect(linkedList, hasLength(5));
      final list = linkedList.toList();
      expect(list, [0, 1, 2, 3, 4]);
      [].insert(index, element)
    });
  });
}

const isStateError = TypeMatcher<StateError>();
final throwsStateError = throwsA(isStateError);
