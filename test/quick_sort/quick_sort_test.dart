import 'package:test/test.dart';
import '../../src/quicksort/PO1_QuickSort.dart';
import '../../resources/Shape.dart';


void main(){

  group('Quicksort:', (){

    test('Sorting a list of int', (){
      List<int> values = [4,6,30,52,3,73,32,34,15,62,42,7,3];
      List<int> results = QuickSort().sort(values);
      expect(results, [3, 3, 4, 6, 7, 15, 30, 32, 34, 42, 52, 62, 73]);
    });

    test('Sorting a list with only one int', (){
      List<int> values = [4];
      List<int> results = QuickSort().sort(values);
      expect(results, [4]);
    });


    test('Sorting a list with two int', (){
      List<int> values = [4, 2];
      List<int> results = QuickSort().sort(values);
      expect(results, [2, 4]);
    });

    test('Sorting a list of String', (){
      List<String> values = ['d', 'b', 'e', 'c', 'a'];
      List<String> results = QuickSort().sort(values);
      expect(results, ['a', 'b', 'c', 'd', 'e']);
    });

    test('Sorting a list of String with int-characters', (){
      List<String> values = ['d', 'b', '1', 'c', 'a', '2'];
      List<String> results = QuickSort().sort(values);
      expect(results, ['1', '2', 'a', 'b', 'c', 'd']);
    });

    test('Sorting a list of String with a null', (){
      List<String> values = ['d', 'b', 'c', 'a', null];
      List<String> results = QuickSort().sort(values);
      expect(results, ['a', 'b', 'c', 'd']);
    });

    test('Sorting a list of Shape', (){
      List<Shape> shapes = [
        new Rectangle(5, 4),
        new Circle(12),
        new Rectangle(1, 2),
        new Rectangle(3, 5),
        new Rectangle(4, 5),
        new Circle(2)];
      List<Shape> results = QuickSort().sort(shapes);
      List<double> values = results.map<double>((Shape shape) => shape.getArea()).toList();
      expect(values, [2.0, 3.141592653589793, 15.0, 20.0, 20.0, 113.09733552923255]);
    });
  });
}


