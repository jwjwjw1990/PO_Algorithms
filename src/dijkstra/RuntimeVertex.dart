import 'iVertex.dart';

class RuntimeVertex implements Comparable<RuntimeVertex>{
  final iVertex vertex;
  double runtimeCost;
  bool visited = false;
  RuntimeVertex parent;

  RuntimeVertex({this.vertex, this.runtimeCost = double.infinity, this.parent});

  @override
  int compareTo(RuntimeVertex other) => runtimeCost.compareTo(other.runtimeCost);
}