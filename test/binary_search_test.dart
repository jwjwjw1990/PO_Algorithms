import '../src/binarySearch/PO3_BinarySearch.dart';
import 'package:test/test.dart';

void main(){

  group('Binary Search:', (){

    test('Insert the first item', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      expect(bTree.getRootValue(), 4);
    });

    test('Insert new lowest value', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(8);
      bTree.insert(3);
      bTree.insert(2);
      expect(bTree.findMin(), 2);
    });

    test('Insert new highest value', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(8);
      bTree.insert(2);
      bTree.insert(9);
      expect(bTree.findMax(), 9);
    });

    test('Insert new value somewhere in the middle', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(8);
      bTree.insert(2);
      bTree.insert(9);
      expect(bTree.find(8), 8);
    });

    test('Find lowest value', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(8);
      bTree.insert(2);
      bTree.insert(9);
      expect(bTree.findMin(), 2);
    });

    test('Find highest value', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(9);
      bTree.insert(2);
      bTree.insert(8);
      expect(bTree.findMax(), 9);
    });

    test('Find specific value', (){
      BinaryTree bTree = BinaryTree();
      bTree.insert(4);
      bTree.insert(9);
      bTree.insert(2);
      bTree.insert(8);
      expect(bTree.find(2), 2);
    });

    test('Find lowest value in empty list', (){
      BinaryTree bTree = BinaryTree();
      expect(bTree.findMin(), null);
    });

    test('Find highest value in empty list', (){
      BinaryTree bTree = BinaryTree();
      expect(bTree.findMax(), null);
    });

    test('Find value in empty list', (){
      BinaryTree bTree = BinaryTree();
      expect(bTree.find(2), null);
    });
  });
}