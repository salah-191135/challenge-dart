class Stack<E> {
  final List<E> _storage;
  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

// challenge 1
  void reverse() {
    print("Original: $_storage");

    final tempList = <E>[];
    // Pop all elements into a list
    while (!isEmpty) {
      tempList.add(pop());
    }

    for (E element in tempList) {
      push(element);
    }

    print('Reversed: $_storage');
  }

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
