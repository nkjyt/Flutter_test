import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'counter_model.dart';


class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyScreenViewModel>.reactive(
      viewModelBuilder: () => MyScreenViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("view model test"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pushed:"
              ),
              Text(
                "${model.someValue}",
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.incrementValue(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        // your widget tree
      ),
    );
  }
}

