import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void jumpToPage(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
