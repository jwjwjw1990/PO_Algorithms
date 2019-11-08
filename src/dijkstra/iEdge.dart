import 'iVertex.dart';

abstract class iEdge{
  double get cost;
  iVertex get destination;
}