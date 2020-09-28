import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class WriteScreenModel extends ChangeNotifier {

  bool _inputBorder = false;
  bool get inputBorder => _inputBorder;

  FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  Future loadData() async {
    // do initialization...
    notifyListeners();
  }
  void doSomething() {
    // do something...
    notifyListeners();
  }

  // when called this method, the focus cursor will be erased
  unfocusNode(){
    _focusNode.unfocus();
    notifyListeners();
  }
}