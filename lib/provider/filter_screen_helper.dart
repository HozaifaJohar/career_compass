import 'package:flutter/material.dart';

class FilterScreenHelper with ChangeNotifier {
  final List<int> _selectedJobId = [];
  List<int> get selectedJobId => _selectedJobId;
  void addToIds(int value) {
    _selectedJobId.add(value);
    notifyListeners();
  }

  void removeFromIds(int value) {
    _selectedJobId.remove(value);
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////

  final List<String> _allSelectedCategories = [];
  List<String> get allSelectedCategories => _allSelectedCategories;
  void addToStatics(String value) {
    _allSelectedCategories.add(value);
    notifyListeners();
  }

  void removeFromStatic(String value) {
    _allSelectedCategories.remove(value);
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////

  final List<String> _allSubCategories = [];
  List<String> get allSubCategories => _allSubCategories;
  void addToSubCategories(String value) {
    _allSubCategories.add(value);
    notifyListeners();
  }

  void removeFromSubCategories(String value) {
    _allSelectedCategories.remove(value);
    notifyListeners();
  }
}
