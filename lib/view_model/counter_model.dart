import 'package:flutter/foundation.dart';
import 'package:fluttertestapp/navigator/NavigationService.dart';
import 'package:fluttertestapp/navigator/locator.dart';

class MyScreenViewModel extends ChangeNotifier {
  int _someValue = 0;
  int get someValue => _someValue;
  Future loadData() async {
    // do initialization...
    notifyListeners();
  }
  incrementValue() {
    _someValue++;
    notifyListeners();
  }
  void navigateNextPage() {
    final NavigationService _navigationService = locator<NavigationService>();
    _navigationService.navigateTo("/second");
  }
  void doSomething() {
    // do something...
    notifyListeners();
  }
}