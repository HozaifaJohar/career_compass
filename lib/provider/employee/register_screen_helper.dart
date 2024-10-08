import 'package:career_compass/models/static.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterHelper with ChangeNotifier {
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

  final List<String> _allCategories = [];

  List<Map<String, String>> getCategories() {
    List<Map<String, String>> allCategories = [];
    for (int i = 0; i < _allCategories.length; i++) {
      allCategories.add({'name': _allCategories[i]});
    }
    return allCategories;
  }

  void addstotic(Static static) {
    List<Static> stotic = [];
  }

  void addToStatics(String value) {
    _allCategories.add(value);
    notifyListeners();
  }

  void removeFromStatic(String value) {
    _allCategories.remove(value);
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////

  final List<String> _allSubCategories = [];
  final List<int> subCategoriesId = [];
  List<int> grtSubId() => subCategoriesId;

  void addSubId(int id) {
    subCategoriesId.add(id);
    notifyListeners();
  }

  void removeSubId(int id) {
    subCategoriesId.remove(id);
    notifyListeners();
  }

  List<Map<String, String>> getSubCategories() {
    List<Map<String, String>> allSubCategories = [];
    for (int i = 0; i < _allSubCategories.length; i++) {
      allSubCategories.add({'name': _allSubCategories[i]});
    }
    return allSubCategories;
  }

  void addToSubCategories(String value) {
    _allSubCategories.add(value);
    notifyListeners();
  }

  void removeFromSubCategories(String value) {
    _allSubCategories.remove(value);
    notifyListeners();
  }

//////////////////////////////////////////////////////////////////////////////////

  String education = '';
  String experience = '';
  int numItems = 0;

  Map<String, String> constItems() {
    Map<String, String> items = {
      "experience": experience,
      "education": education,
    };
    notifyListeners();
    return items;
  }
//////////////////////////////////////////////////////////////////////////////////

  bool filterScreenValidation() {
    if (getSubCategories().isEmpty || getCategories().isEmpty || numItems < 2) {
      return false;
    }
    return true;
  }
}
//////////////////////////////////////////////////////////////////////////////////