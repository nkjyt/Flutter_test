import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'SecondScreenModel.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyScreenViewModel>.reactive(
      viewModelBuilder: () => MyScreenViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Second screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ),
        // your widget tree
      ),
    );
  }
}