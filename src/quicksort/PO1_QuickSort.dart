import 'dart:core';

class QuickSort<T extends Comparable>{

  List<T> sort(List<T> arr){
    arr.removeWhere((value) => value == null);
    return _internalSort(arr, 0, arr.length - 1);
  }

  // Private Methods
   List<T> _internalSort(List<T> arr, int a, int b){
     if(a < b){
       var index;
       index = _partition(arr, a, b);
       _internalSort(arr, a, index);
       _internalSort(arr, index + 1, b);
     }
     return arr;
  }

   int _partition(arr, low, high){
     T pivot = _getMedian(arr, low, high);
     int i = (low - 1);

     for (int j = low; j <= high -1; j++){
       if(arr[j].compareTo(pivot) <= 0){
         i++;
         _swap(arr,i, j);
       }
     }
     _swap(arr, i+1, high);
     return i;
   }

  void _swap(List<T> items, int left, int right){
    T temp = items[left];
    items[left] = items[right];
    items[right] = temp;
  }

  T _getMedian(List<T> items, int left, int right){
    T mid = items[(right+left)~/2];
    T first = items[left];
    T last = items[right];
    if(mid == null || first == null || last == null) throw Exception('Can''t sort null');
    if(mid.compareTo(first) > 0 && mid.compareTo(last) < 0) return mid;
    if(first.compareTo(mid) > 0 && first.compareTo(last) < 0) return first;
    return last;
   }
}

