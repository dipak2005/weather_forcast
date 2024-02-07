import 'package:flutter/material.dart';

class WeatherPro extends ChangeNotifier {
  bool isShow = false;

int listIndex=0;
  void show() {
    isShow = true;
    notifyListeners();
  }

  void hide() {
    isShow = false;
    notifyListeners();
  }

  void changeIndex(int index){
    listIndex=index;
    notifyListeners();
  }
}
