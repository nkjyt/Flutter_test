import 'package:flutter/foundation.dart';
import 'package:fluttertestapp/navigator/NavigationService.dart';
import 'package:fluttertestapp/navigator/locator.dart';

class HomeScreenModel extends ChangeNotifier {

  Future loadData() async {
    // do initialization...
    notifyListeners();
  }
  void doSomething() {
    // do something...
    notifyListeners();
  }

  void navigateNextPage() {
    final NavigationService _navigationService = locator<NavigationService>();
    _navigationService.navigateTo("/write");
  }

}