import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  int _globalVariable = 117;

  int get globalVariable => _globalVariable;

  void setGlobalVariable(int value) {
    _globalVariable = value;
    notifyListeners();
  }
}
