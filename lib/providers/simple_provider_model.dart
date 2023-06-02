import 'package:flutter/foundation.dart';

class Mymodel with  ChangeNotifier{
  // list  - map  custom object , string
  String someValue = "Hello";
  int _counter = 0;

  int get  counter => _counter ;
  increementCounter(){
    _counter ++;
     notifyListeners() ;
  }





  void changeValue(){
    someValue = "Good bay ";
    print("--------");
    print(someValue);
    notifyListeners();


  }


}