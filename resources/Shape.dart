import 'dart:math';

abstract class Shape implements Comparable<Shape>{
  final double _area;
  final double _boundary;

  Shape(this._area, this._boundary);

  @override
  int compareTo(Shape other) {
    return (this._area > other._area)? 1 : (other._area > this._area)? -1 : 0;
  }

  double getArea(){
    return _area;
  }

  double get_boundary(){
    return _boundary;
  }

  @override
  String toString() {
    return this.getArea().toString();
  }
}

class Rectangle extends Shape{
  Rectangle(double height, double width):super((height*width), (width+height)*2);
}

class Circle extends Shape{
  Circle(double diameter):super((pi*(diameter/2)*(diameter/2)),diameter * pi);
}


