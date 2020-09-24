import 'package:flutter/foundation.dart';
import 'package:fluttertestapp/utils/NavigationService.dart';
import 'package:fluttertestapp/utils/locator.dart';

class MyScreenViewModel extends ChangeNotifier {
  int _someValue = 0;
  int get someValue => _someValue;
  Future loadData() async {
    // do initialization...
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