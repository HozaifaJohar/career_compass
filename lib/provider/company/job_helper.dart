import 'package:flutter/material.dart';

class JobHelper extends ChangeNotifier {
  int idLevel = 0;
  int idType = 0;
  int get idtype => idType;
  int get idStatic => idLevel;

  final List<int> _selectedRoleId = [];
  List<int> get selectedJobRoleId => _selectedRoleId;
  void addCaty(int value) {
    _selectedRoleId.add(value);
    notifyListeners();
  }

  void removeCaty(int value) {
    _selectedRoleId.remove(value);
    notifyListeners();
  }

  ////////
  final List<int> _selectedQualId = [];
  List<int> get selectedJobQualId => _selectedQualId;
  void addQual(int value) {
    _selectedQualId.add(value);
    notifyListeners();
  }

  void removeQual(int value) {
    _selectedQualId.remove(value);
    notifyListeners();
  }

  ////////////
  void addIdLevel(int val) {
    idLevel = val;
    notifyListeners();
  }

  void addIdTepe(int val) {
    idType = val;
    notifyListeners();
  }

  bool isEmpty() {
    if (_selectedRoleId.isEmpty ||
        _selectedQualId.isEmpty ||
        idLevel == 0 ||
        idType == 0) {
      return true;
    } else {
      return false;
    }
  }
}
