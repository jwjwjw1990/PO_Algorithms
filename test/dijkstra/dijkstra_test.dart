import '../../src/dijkstra/iEdge.dart';
import '../../src/dijkstra/iVertex.dart';
import '../../src/dijkstra/PO2_Dijkstra.dart';
import 'package:test/test.dart';

// [Rotterdam, Leiden, Amsterdam, Hilversum]
main(){

  group('Dijkstra:', (){

    test('Get path from Rotterdam to Hilversum', (){
      Map map = Map();
      List<City> results = Dijkstra(map.rotterdam, map.hilversum).search();
      List<String> values = results.map<String>((City city) => city.toString()).toList();
      expect(values, ['Rotterdam', 'Leiden', 'Amsterdam', 'Hilversum']);
    });

    test('Get path from Amsterdam to Amsterdam', (){
      Map map = Map();
      List<City> results = Dijkstra(map.amsterdam, map.amsterdam).search();
      List<String> values = results.map<String>((City city) => city.toString()).toList();
      expect(values, ['Amsterdam']);
    });


    test('Get path through Amsterdam, when a highway Amsterdam-Amsterdam is added', (){
      Map map = Map();
      map.amsterdam.highways.add(Highway(cost: 23, destination: map.amsterdam));
      List<City> results = Dijkstra(map.rotterdam, map.hilversum).search();
      List<String> values = results.map<String>((City city) => city.toString()).toList();
      expect(values, ['Rotterdam', 'Leiden', 'Amsterdam', 'Hilversum']);
    });

    test('Get path from Amsterdam to Amsterdam, when a highway Amsterdam-Amsterdam is added', (){
      Map map = Map();
      map.amsterdam.highways.add(Highway(cost: 23, destination: map.amsterdam));
      List<City> results = Dijkstra(map.amsterdam, map.amsterdam).search();
      List<String> values = results.map<String>((City city) => city.toString()).toList();
      expect(values, ['Amsterdam']);
    });

    test('Throw error when getting path from Amsterdam to New York', (){
      Map map = Map();
      expect(() => Dijkstra(map.rotterdam, map.newyork).search(), throwsException);
    });
  });
}

class Map{
  City amsterdam = City(id: 0, name: 'Amsterdam');
  City rotterdam = City(id: 1, name: 'Rotterdam');
  City utrecht = City(id: 2, name: 'Utrecht');
  City hilversum = City(id: 3, name: 'Hilversum');
  City leiden = City(id: 4, name: 'Leiden');
  City newyork = City(id: 5, name: "New York");

  Map(){
    leiden.highways.add(Highway(cost: 17, destination: rotterdam));
    rotterdam.highways.add(Highway(cost: 17, destination: leiden));

    amsterdam.highways.add(Highway(cost: 23, destination: hilversum));
    hilversum.highways.add(Highway(cost: 23, destination: amsterdam));

    amsterdam.highways.add(Highway(cost: 26, destination: utrecht));
    utrecht.highways.add(Highway(cost: 26, destination: amsterdam));

    amsterdam.highways.add(Highway(cost: 29, destination: leiden));
    leiden.highways.add(Highway(cost: 29, destination: amsterdam));

    utrecht.highways.add(Highway(cost: 28, destination: leiden));
    leiden.highways.add(Highway(cost: 28, destination: utrecht));
  }

}

class Highway implements iEdge{
  final double cost;
  final iVertex destination;

  Highway({this.cost, this.destination});
}

class City implements iVertex{
  final int id;
  final String name;
  List<Highway> highways = [];

  City({this.id, this.name});

  @override
  List<iEdge> get edges => highways;

  @override
  String toString() => name;
}