class Node<T> {
  final T value;
  Node<T>? left;
  Node<T>? right;

  Node({required this.value, this.left, this.right});
}

class Data {
  final int key;
  final int value;

  Data(this.key, this.value);
}

class BinaryTree<T extends Data> {
  Node<T>? root;

  BinaryTree({this.root});
  T? search(int value) {
    if (root == null) return null;
    var counter = 0;
    if (root!.value.key == value) return root!.value;
    while (root != null) {
      counter++;
      print(counter);

      if (root!.left != null && root!.left!.value.key >= value) {
        if (root!.left!.value.key == value) {
          return root!.left!.value;
        } else {
          root = root!.left;
        }
      } else {
        if (root!.right != null && root!.right!.value.key == value) {
          return root!.right!.value;
        } else {
          root = root!.right;
        }
      }
    }
  }

  void add(T value) {
    final newNode = Node(value: value);
    if (root == null) {
      root = newNode;
      return;
    }
    var currentNode = root;
    while (currentNode != null) {
      if (newNode.value.key < currentNode.value.key) {
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
