import 'package:flutter/material.dart';

class TypeProvider with ChangeNotifier {
  bool _type = true;

  bool get type => _type;

  void setType(bool newValue) {
    _type = newValue;
  }
}
