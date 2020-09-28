import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'HomeScreenModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigateNextPage(),
          tooltip: 'navigation',
          child: Icon(Icons.add),
        ),
        // your widget tree
      ),
    );
  }
}