import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  int _bottomIndex = 0;

  int get bottomIndex => _bottomIndex;

  set bottomIndex(int index) {
    if (index < 0 || index > 2) {
      throw Exception('wrong index');
    }
    _bottomIndex = index;
    notifyListeners();
  }
}
