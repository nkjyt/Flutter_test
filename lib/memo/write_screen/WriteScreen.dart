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
          actions: <Widget>[
            FlatButton(
              child: Text('Finish'),
              onPressed: () => model.unfocusNode(),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),

          child: TextField(
            focusNode: model.focusNode,

            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: "Input memo",
              border: InputBorder.none
            ),

            maxLines: null,
            onChanged: (s) => {},
            style: TextStyle(
              fontSize: 24.0
            ),
          ),

        ),

        // your widget tree
      ),
    );
  }
}