import 'package:flutter/material.dart';

class FilterScreenHelper with ChangeNotifier {
  final List<int> _selectedJobId = [];

  List<int> get selectedJobId => _selectedJobId;

  void setToIds(int value) {
    _selectedJobId.add(value);
    notifyListeners();
  }

  void removeFromIds(int value) {
    _selectedJobId.remove(value);
    notifyListeners();
  }
}
