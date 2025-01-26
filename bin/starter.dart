import 'package:starter/stack.dart';

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

// challenge 1
  // const list = ['S', 'M', 'O', 'K', 'E'];
  // final smokeStack = Stack.of(list);
  // smokeStack.reverse();

// challenge 2
  print(isBalanced('((()))')); // true
  print(isBalanced('(()()()())')); // true
  print(isBalanced('(()((())()))')); // true
  print(isBalanced('((((((())')); // false
  print(isBalanced('()))')); // false
  print(isBalanced('(()()(()')); // false
}
