import 'dart:collection';

import 'package:binary_tree/binary_tree.dart';

void main(List<String> args) {
  final tree = BinaryTree<Data>();
  tree.add(Data(7, 77));
  tree.add(Data(3, 33));
  tree.add(Data(2, 22));
  tree.add(Data(4, 44));
  tree.add(Data(5, 55));
  tree.add(Data(9, 99));
  tree.add(Data(8, 88));
  tree.add(Data(12, 1212));
  tree.add(Data(10, 1010));
  tree.add(Data(13, 1313));
  tree.add(Data(11, 111));

  tree.add(Data(25, 2525));
  tree.add(Data(15, 151511));
  tree.add(Data(14, 141414));
  print(tree.search(3)?.value);
  //traverseIteration<int>(node: tree.root, callback: (v) => print(v!.value));
  // final traverse = TraverseIterable<Node<int>>(tree.root!);
  // traverse.forEach((element) {
  //   print(element.value);
  // });
}

class Stack<T> {
  final _queue = Queue<T>();
  bool get isEmpty => _queue.isEmpty;

  void push(T value) {
    _queue.addLast(value);
  }

  T pop() {
    return _queue.removeLast();
  }

  void clear() {
    _queue.clear();
  }
}

void traverseIteration<T>({Function(Node<T>?)? callback, Node<T>? node}) {
  final stack = Stack<Node<T>>();
  while (true) {
    while (node != null) {
      stack.push(node);
      node = node.left;
    }

    if (stack.isEmpty) {
      return;
    }

    node = stack.pop();
    if (callback != null) {
      callback(node);
    }
    node = node.right;
  }
}

class TraverseIterable<T extends Node> extends Iterable<T> {
  final T root;

  TraverseIterable(this.root);
  @override
  Iterator<T> get iterator => TraverseIterator<T>(root);
}

class TraverseIterator<T extends Node> extends Iterator<T> {
  T? root;

  TraverseIterator(this.root) {
    _root = root;
  }
  @override
  T get current => _root as T;
  T? _root;
  final stack = Stack<T>();

  @override
  bool moveNext() {
    while (root != null) {
      stack.push(root!);
      root = root!.left as T?;
    }
    if (stack.isEmpty) {
      return false;
    }
    root = stack.pop();
    _root = root;

    root = root!.right as T?;
    return true;
  }
}

void traverseBFS<T>({Function(Node<T>?)? callback, Node<T>? node}) {
  final queue = Queue<Node<T>?>.from([node]);
  while (queue.isNotEmpty) {
    final nextNode = queue.removeFirst();
    if (callback != null) {
      callback(nextNode);
    }
    if (nextNode!.left != null) {
      queue.addLast(nextNode.left);
    }
    if (nextNode.right != null) {
      queue.addLast(nextNode.right);
    }
  }
}

void preOrderDFS<T>({Function(Node<T>?)? callback, Node<T>? node}) {
  if (node == null) return;
  if (callback != null) {
    callback(node);
  }
  preOrderDFS(callback: callback, node: node.left);
  preOrderDFS(callback: callback, node: node.right);
}

void inOrderDFS<T>({Function(Node<T>?)? callback, Node<T>? node}) {
  if (node == null) return;

  inOrderDFS(callback: callback, node: node.left);
  if (callback != null) {
    callback(node);
  }
  inOrderDFS(callback: callback, node: node.right);
}

void postOrderDFS<T>({Function(Node<T>?)? callback, Node<T>? node}) {
  if (node == null) return;

  postOrderDFS(callback: callback, node: node.left);
  postOrderDFS(callback: callback, node: node.right);
  if (callback != null) {
    callback(node);
  }
}
//    7
//   3|   9
//  2|4 |8|12
//    |5  10|13 
//         |11|25
//           15| 
//          14|    
//            