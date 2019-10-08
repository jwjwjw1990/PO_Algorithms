import 'dart:math';
import 'dart:core';

main(){

 Random rnd = new Random();
 List<Shape> shapes = new List(10);
 for(int i = 0; i < 10; i++){
   shapes.add(new Rectangle(rnd.nextDouble(), rnd.nextDouble()));
 }
 
 QuickSort qSort = new QuickSort();
 qSort.quicksort(shapes, 0, shapes.length);
}

class QuickSort{
  List<T> quicksort<T>(A, lo, hi){
    var p = partition(A,lo,hi);
    quicksort(A, lo, p - 1);
    quicksort(A, p + 1, hi);
    return A;
  }

  partition(A, lo, hi){
    int pivot = A[hi];
    var i = lo;
    for(int j = lo; j < hi; j++) {
      if (A[j] < pivot){
        swap(A, A[j], A[i]);
        i++;
      }
    }
    swap(A, A[i], A[hi]);
    return i;
  }

  swap(A, f, s){
    int t = f;
    f = s;
    s = t;
    A[f] = s;
    A[s] = f;
  }
}

abstract class Shape implements Comparable<Shape>{
  final double _area;

  Shape(this._area);

  @override
  int compareTo(Shape other) {
    return (other._area < this._area)? 1 : -1;
  }
}

class Rectangle extends Shape{
  Rectangle(double height, double width):super(height*width);
}

class Circle extends Shape{
  Circle(double diameter):super(pi*(diameter/2)*(diameter/2));
}
