import 'package:flutter/cupertino.dart';

class PageIndexProvider extends ChangeNotifier {
  // control which page should be display
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    _menuIsOpen = false;

    notifyListeners();
  }

  // true to open menu and false to close it
  // when open menu close search options
  bool _menuIsOpen = false;
  bool get menuIsOpen => _menuIsOpen;
  set menuIsOpen(bool menuIsOpen) {
    _menuIsOpen = menuIsOpen;
    if(menuIsOpen == true)
      _searchIsOpen = false;
    notifyListeners();
  }

  // true to open search options and false to close it
  // when open search options close menu
  bool _searchIsOpen = false;
  bool get searchIsOpen => _searchIsOpen;
  set searchIsOpen(bool searchIsOpen) {
    _searchIsOpen = searchIsOpen;
    if(searchIsOpen == true)
      _menuIsOpen = false;
    notifyListeners();
  }

  void resetMenus(){
    _searchIsOpen = false;
    _menuIsOpen = false;
    notifyListeners();
  }
}