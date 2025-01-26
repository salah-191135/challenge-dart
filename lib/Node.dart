class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var current = head;
    var i = 0;

    while (current != null && i < index) {
      current = current.next;
      i++;
    }
    return current;
  }

  Node<E>? insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) tail = null;
    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  // challenge 2 find the middle node
  Node<E>? findMiddle() {
    var slow = head;
    var fast = head;
    while (fast?.next != null) {
      fast = fast?.next?.next;
      slow = slow?.next;
    }
    return slow;
  }

// challenge 3 reverse the linked list
  void reverse() {
    Node<E>? previous;
    Node<E>? current = head;
    Node<E>? next;

    while (current != null) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    tail = head;
    head = previous;
    print('after: $this');
  }

// challenge 4 remove all accurences
  void removeAll(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    var current = head;
    while (current?.next != null) {
      if (current!.next!.value == value) {
        current.next = current.next!.next; // Skip the matching node
      } else {
        current = current.next; // Move to the next node
      }
    }
    tail = head;
    while (tail?.next != null) {
      tail = tail!.next;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return head.toString();
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator<E>(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
