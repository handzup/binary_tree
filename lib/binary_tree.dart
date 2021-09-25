class Node<T> {
  final T value;
  Node<T>? left;
  Node<T>? right;

  Node({required this.value, this.left, this.right});
}

class BinaryTree<T extends num> {
  Node<T>? root;

  BinaryTree({this.root});

  void add(T value) {
    final newNode = Node(value: value);
    if (root == null) {
      root = newNode;
      return;
    }
    var currentNode = root;
    while (currentNode != null) {
      if (newNode.value < currentNode.value) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        }
        currentNode = currentNode.left;
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        }
        currentNode = currentNode.right;
      }
    }
  }
}
