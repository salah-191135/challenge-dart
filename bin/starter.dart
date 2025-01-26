import 'package:starter/Stack.dart';
import 'package:starter/Node.dart';

// Balance the Parentheses
bool isBalanced(String expression) {
  final stack = Stack<String>();
  for (final char in expression.split('')) {
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false;
      }
      stack.pop();
    }
  }
  return stack.isEmpty;
}

// print linked list in reverse
void printReverseRecursive<E>(Node<E>? node) {
  if (node == null) return;
  printReverseRecursive(node.next);
  print(node.value);
}

void main() {
  // final stack = Stack<int>();
  // stack.push(1); // Add 1
  // stack.push(2); // Add 2
  // stack.push(3); // Add 3
  // stack.push(4); // Add 4
  // print(stack);
  // final element = stack.pop();
  // print('Popped: $element');
  // print(stack);

// stack challenge 1
  // const list = ['S', 'M', 'O', 'K', 'E'];
  // final smokeStack = Stack.of(list);
  // smokeStack.reverse();

// stack challenge 2
  // print(isBalanced('((()))')); // true
  // print(isBalanced('(()()()())')); // true
  // print(isBalanced('(()((())()))')); // true
  // print(isBalanced('((((((())')); // false
  // print(isBalanced('()))')); // false
  // print(isBalanced('(()()(()')); // false

  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);
  // final node4 = Node(value: 4);
  // node1.next = node2;
  // node2.next = node3;
  // node3.next = node4;
  // print(node1);

  // final list = LinkedList<int>();
  // list.push(4);
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // list.append(1);
  // list.append(2);
  // list.append(3);
  // print("before :$list");
  // var middleNode = list.nodeAt(1)!; //at index 1
  // list.insertAfter(middleNode, 99);
  // print("after :$list");

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // for (final element in list) {
  //   print(element);
  // }
  // print('list length is ${list.length}');

  final list = LinkedList<int>();
  // list.push(2);
  // list.push(1);
  list.push(5);
  // list.push(1);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);
  //challenge 1 print in reverse order
  // printReverseRecursive(list.head);

  // linked list challenge 2 remove last element
  // print(list.findMiddle()?.value);

// linked list challenge 3 reverse the linked list
  // print('before: $list');
  // list.reverse();

// linked list challenge 4 Remove All Occurrences
  print('before removing 1 :$list');
  list.removeAll(1);
  print('after removing 1 :$list');
}
