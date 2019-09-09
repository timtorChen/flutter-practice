


import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier{
    int _count =0;
    int get value=> _count;

    void increment(){
      _count++;
      notifyListeners();
    }
}