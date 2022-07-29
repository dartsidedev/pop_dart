// benefits: insertions and deletions are very quick (at the beginning of the list): constant time O(1)

// similar to IterableElementError

import 'dart:collection';

abstract class LinkedListError {
  static StateError noElement([String? message]) =>
      StateError('No element${message == null ? '' : ' ($message)'}');
}

// nth element insert and delete is not that fast..
class LinkedList<E> extends IterableBase<E> {
  // most basic version got no length, etc
  LinkedList();

  LinkedListNode<E>? _head;

  int _length = 0;

  int get length => _length;

  // think about best naming: insert in front, remove in front?
  // this is faaaast
  void addFirst(E value) {
    final node = LinkedListNode(value);
    node.next = _head;
    _head = node;
    _length++;
  }

  // this is slow! O(n)
  void add(E value) {
    final node = LinkedListNode(value);
    var x = _head;
    if (x == null) {
      _head = node;
      _length++;
      return;
    }
    while (x!.next != null) x = x.next;
    x.next = node;
    _length++;
  }

  // addAll cannot just reuse add, it is inefficient! (doubly inefficient :D)
  void addAll(Iterable<E> iterable) {
    if (iterable.isEmpty) return;
    var skipCount = 0;
    if (_head == null) {
      final first = iterable.first;
      final node = LinkedListNode(first);
      _head = node;
      skipCount++;
      _length++;
    }
    var x = _head;
    while (x!.next != null) x = x.next;
    for (final value in iterable.skip(skipCount)) {
      final node = LinkedListNode(value);
      _length++;
      x!.next = node;
      x = x.next;
    }
  }

  // this is ffaaaaast
  E removeFirst() {
    // Handle empty case and throw sane error;
    final head = _head;
    if (head == null) {
      throw LinkedListError.noElement('Cannot remove head, no head');
    }
    _length--;
    final value = head.value;
    this._head = head.next;
    return value;
  }

  // void insert(int index, E element);
  // void insertAll(int index, Iterable<E> iterable);
  // void clear();
  // int lastIndexOf(E element, [int? start]);
  // int lastIndexWhere(bool test(E element), [int? start]);
  // int indexWhere(bool test(E element), [int start = 0]);
  // int indexOf(E element, [int start = 0]);
  // Iterable<E> get reversed;
  // void set first(E value);
  // void operator []=(int index, E value);
  // E operator [](int index);
  //
  // void setAll(int index, Iterable<E> iterable);
  // bool remove(Object? value);
  // E removeAt(int index);
  // E removeLast();
  // void removeWhere(bool test(E element));
  // void retainWhere(bool test(E element));
  // List<E> operator +(List<E> other);
  // // some other ranges and stuff
  // Map<int, E> asMap();






  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(this.linkedList) : _currentNode = linkedList._head;

  final LinkedList<E> linkedList;

  E? _current;
  LinkedListNode<E>? _currentNode;

  @override
  E get current => _current as E;

  @override
  bool moveNext() {
    final currentNode = _currentNode;
    if (currentNode == null) {
      _current = null;
      return false;
    }
    _current = currentNode.value;
    _currentNode = currentNode.next;
    return true;
  }
}

// better linkedlist could

// TODO: which one should be the LinkedList and which is the Fancy/SimpleLinkedList?
// todo: understand why dart's collection linkedlist needs a different class for entries, like wtf why

// todo: put inefficient algs in extension maybe?

class LinkedListNode<T> {
  LinkedListNode(this.value);

  // todo: should it be final?
  T value;
  LinkedListNode<T>? next;
}
