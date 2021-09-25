import 'dart:collection';

import 'package:binary_tree/binary_tree.dart';

void main(List<String> args) {
  final tree = BinaryTree<int>();
  tree.add(7);
  tree.add(3);
  tree.add(2);
  tree.add(4);
  tree.add(9);
  tree.add(8);
  tree.add(12);
  tree.add(10);
  tree.add(13);
  tree.add(11);

  traverseBFS<int>(node: tree.root, callback: (v) => print(v!.value));
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
//      7
//   3    9 
//  2 4 |8 | 12
//          10  13
//            11
