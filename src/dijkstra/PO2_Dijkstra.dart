import 'package:collection/collection.dart';
import 'iEdge.dart';
import 'iVertex.dart';
import 'RuntimeVertex.dart';

class Dijkstra<T extends iVertex>{
  HeapPriorityQueue<RuntimeVertex> priorityQueue = HeapPriorityQueue<RuntimeVertex>();
  Map<int,RuntimeVertex> evaluatedVertices = Map<int,RuntimeVertex>();
  final T from;
  final T destination;

  Dijkstra(this.from, this.destination);

  List<T> search(){
    _addRuntimeVertex(from, 0, null);
    while(!priorityQueue.isEmpty){
      RuntimeVertex current = priorityQueue.removeFirst();
      if(current.vertex.id == destination.id) return _backtrace(current, [current.vertex]);

      for(iEdge edge in current.vertex.edges){
        if(_isVisited(edge.destination)) continue;
        double newCost = current.runtimeCost + edge.cost;
        _evaluateVertex(edge.destination, newCost, current);
      }

      current.visited = true;
    }
    throw Exception('No valid path was found');
  }


  // Private Methods
  List<T> _backtrace(RuntimeVertex runtimeVertex, List<T> path){
    if(runtimeVertex.vertex.id == from.id) return path;
    path.insert(0, runtimeVertex.parent.vertex);
    return _backtrace(runtimeVertex.parent, path);
  }

  void _evaluateVertex(T vertex, double cost, RuntimeVertex parent){
    if(_isEvaluated(vertex)) return _updateVertex(vertex, cost);
    _addRuntimeVertex(vertex, cost, parent);
  }

  void _updateVertex(T vertex, double cost){
    RuntimeVertex evaluatedVertex = evaluatedVertices[vertex.id];
    if(evaluatedVertex.runtimeCost < cost) return;
    evaluatedVertex.runtimeCost = cost;
    priorityQueue.remove(evaluatedVertex);
    priorityQueue.add(evaluatedVertex);
  }

  void _addRuntimeVertex(T vertex, double cost, RuntimeVertex parent){
    RuntimeVertex runtimeVertex = RuntimeVertex(vertex: vertex, runtimeCost: cost, parent: parent);
    priorityQueue.add(runtimeVertex);
    evaluatedVertices[vertex.id] = runtimeVertex;
  }

  bool _isVisited(T vertex){
    return _isEvaluated(vertex)&&
        evaluatedVertices[vertex.id].visited;
  }

  bool _isEvaluated(T vertex){
    return evaluatedVertices.containsKey(vertex.id);
  }
}
