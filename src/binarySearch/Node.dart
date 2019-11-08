
class Node{
  final int key;
  int value;
  Node left;
  Node right;

  Node(this.key, this.value);

  String printStructure(){
    String info = '';
    info += value.toString() + childValues();
    info += '\n';
    if(left != null) info += left.printStructure();
    if(right != null) info += right.printStructure();
    return info;
  }

  String childValues(){
    String info = '';
    if(left != null) info += ' -< ' + left.value.toString();
    if(right != null) info += ' -> ' + right.value.toString();
    return  info;
  }
}