import 'package:flutter/cupertino.dart';

class ValueNotifierModel
{

  ValueNotifier<String> myVar  = ValueNotifier('hello') ;
   void  doSomething ()  {
     myVar.value = 'shaimaa';
     myVar.notifyListeners();
    print(myVar.value);
  }
}