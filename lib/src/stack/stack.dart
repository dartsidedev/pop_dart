import 'dart:collection' as c;

// http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/687fd7c7986d/src/share/classes/java/util/Stack.java
abstract class Stack<T> {
  void push(T element);
  T pop();
  T peek();

  bool get isEmpty;
  bool get isNotEmpty => !isEmpty;
  int get length;

  // elements? items?
  Iterable<T> get elements;
  // isempty, iterable values (might be inefficient)
  // length
}

class ListStack<T> implements Stack<T> {

}

/// Explain pros and cons.
///
/// When the size of the stack is not known in advance
///
/// The beginning of the linked list is the top of the stack
class LinkedListStack<T> implements Stack<T> {

}

final ll = c.LinkedList();

// todo: think about what to expose and what to keep private, both in terms of classes, fields, etc.
// TODO: make sure you are using similar namings to Dart's
// TODO: make sure to explain why use this over collection

