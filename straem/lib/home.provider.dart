import 'dart:async';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int count1=0;
  int count2=0;
  int count3=0;
  int count4=0;
  void inCrement(){
    count1++;
    notifyListeners();
  }
  Stream<int> inCrementStreamWhile(int num) async*{
    while(count2<num){
      yield count2++;
      notifyListeners();
      await Future.delayed(Duration(seconds: 1));
      

    }
  }
  
}
class StreamCounter{
  StreamController<int> streamController = StreamController();
  Stream<int> get stream=> streamController.stream;
  
  int value =0;
StreamCounter(){
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      streamController.add(value++);
    });
  }

}