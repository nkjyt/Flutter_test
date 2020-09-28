import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'WriteScreenModel.dart';

class WriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WriteScreenModel>.reactive(
      viewModelBuilder: () => WriteScreenModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('add new memo'),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Input memo",
            ),
            maxLines: null,
          ),

        ),

        // your widget tree
      ),
    );
  }
}