import 'dart:math';
import 'dart:core';

class BinaryTree {
  Node _rootNode;

  BinaryTree({
    Node rootNode
  }):
        _rootNode = rootNode,
        assert(_rootNode != null);
}

class Node{
  final int key;
  int value;
  Node left;
  Node right;

  Node{(this.key,
  this.value)};
}