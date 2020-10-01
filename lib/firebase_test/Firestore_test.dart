import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTest extends StatefulWidget {
  @override
  FirestoreTestState createState() => FirestoreTestState();
}

class FirestoreTestState extends State<FirestoreTest> {

  @override
  void initState() {
  }

  void  putDataTest() async {
    DocumentReference ref = await FirebaseFirestore.instance.collection("user").doc("test");
    ref.get().then((dc){
      ref.set({"test" : "te"});
    });
    //await FirebaseFirestore.instance.collection("user").doc("test").set({}).then((value) => print('ok')).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase test"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("put data"),
              onPressed: () => putDataTest(),
            )
          ],
        ),
      ),
    );
  }
}