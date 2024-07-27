import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _hourCount = 0;
  int exper = 0;
  int maxEmp = 0;

  int get countHour => _hourCount;
  void addHour() {
    _hourCount++;
    notifyListeners();
  }

  void subHour() {
    _hourCount--;
    notifyListeners();
  }

  int get countExper => exper;

  void addExpr() {
    exper++;
    notifyListeners();
  }

  void subExpr() {
    exper--;
    notifyListeners();
  }
int get countMax => maxEmp;

  void addMax() {
    maxEmp++;
    notifyListeners();
  }

  void subMax() {
    maxEmp--;
    notifyListeners();
  }

}
