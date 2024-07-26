import 'package:flutter/material.dart';

class FilterHelper with ChangeNotifier {
  final List<int> _rolesId = [];
  List<int> get rolesId => _rolesId;
  void addRole(int value) {
    _rolesId.add(value);
    notifyListeners();
  }

  void removeRole(int value) {
    _rolesId.remove(value);
    notifyListeners();
  }

///////////////////////////////////////////////////
  final List<int> _subIdes = [];
  List<int> get subIdes => _subIdes;
  void addSub(int value) {
    _subIdes.add(value);
    notifyListeners();
  }

  void removeSub(int value) {
    _subIdes.remove(value);
    notifyListeners();
  }

///////////////////////////////////////////////////
  final List<int> _ides = [];
  List<int> get ides => _ides;
  void addId(int value) {
    _ides.add(value);
    notifyListeners();
  }

  void removeId(int value) {
    _ides.remove(value);
    notifyListeners();
  }

///////////////////////////////////////////////////
}
