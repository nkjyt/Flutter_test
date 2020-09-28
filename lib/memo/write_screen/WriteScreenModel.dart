import 'package:flutter/foundation.dart';

class WriteScreenModel extends ChangeNotifier {

  bool _inputBorder = false;

  Future loadData() async {
    // do initialization...
    notifyListeners();
  }
  void doSomething() {
    // do something...
    notifyListeners();
  }
}