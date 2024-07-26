import 'package:flutter/material.dart';

class OntapNavigationEmployee with ChangeNotifier {
  int _index = 1;

  int get index => _index;
  PageController pageController = PageController(initialPage: 1);

  void setIndex(int newIndex) {
    _index = newIndex;
    pageController.animateToPage(newIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc);
    notifyListeners();
  }

  void newIndex(int newIndex) {
    _index = newIndex;
    pageController = PageController(initialPage: newIndex);
    notifyListeners();
  }
}
