import 'dart:core';
import 'Node.dart';

class BinaryTree {
  Node _rootNode;

  BinaryTree();

  void insert(int value){
    if(_rootNode == null) _rootNode = Node(value,value);
    _evaluateNode(_rootNode, value);
  }

  int find(int value){
    if(_rootNode == null) return null;
    return _findInternal(_rootNode, value);
  }

  int findMin(){
    if(_rootNode == null) return null;
    return _getLeftMost(_rootNode);
  }

  int findMax(){
    if(_rootNode == null) return null;
    return _getRightMost(_rootNode);
  }

  void remove(int){
    if(_rootNode == null) return null;
    //
  }

  void printStructure(){
    print(_rootNode.printStructure());
  }

  int getRootValue(){
    return _rootNode.value;
  }

  // Private Methods
  void _evaluateNode(Node node, int value){
    if(node.value == value) return;
    if(value < node.value){
      if(node.left == null)
        node.left = Node(value, value);
      else
        _evaluateNode(node.left, value);
    } else if(value > node.value) {
      if (node.right == null)
        node.right = Node(value, value);
      else
        _evaluateNode(node.right, value);
    }
  }

  int _getLeftMost(Node node){
    if(node.left == null) return node.value;
    else return _getLeftMost(node.left);
  }

  int _getRightMost(Node node){
    if(node.right == null) return node.value;
    else return _getRightMost(node.right);
  }

  int _findInternal(Node node, int value){
    if(node.value == value) return value;
    if(value < node.value && node.left != null) return _findInternal(node.left, value);
    if(value > node.value && node.right != null) return _findInternal(node.right, value);
    return null;
  }
}
