import 'package:flutter/material.dart';

class OntapNavigationCompany with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  PageController pageController = PageController(initialPage: 0);

  void setIndex(int newIndex) {
    _index = newIndex;
    pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCirc,
    );
    notifyListeners();
  }

  void newIndex(int newIndex) {
    _index = newIndex;
    pageController = PageController(initialPage: newIndex);
    notifyListeners();
  }
}
