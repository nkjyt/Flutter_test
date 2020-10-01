import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget{

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen>{

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _uid;
  bool checkValue = false;
  bool isRegesterd = false;
  SharedPreferences sharedPreferences;

  _setUserInfo(UserCredential result) async{
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString('uid',result.user.uid);
    });

  }

  Future<UserCredential> _signIn(String email, String password) async {
    final UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print("User id is ${result.user.uid}");
    _uid = result.user.uid;
    _setUserInfo(result);
    return result;
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    final UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    print("User id is ${result.user.uid}");
    _setUserInfo(result);
    return result;
  }


  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: _layoutBody(),
      ),
    );
  }


  Widget _layoutBody() {
    return new Center(
      child: new Form(
        child: new SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: password,
                decoration: new InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              new CheckboxListTile(
                value: checkValue,
                onChanged: _onChanged,
                title: new Text("Remember email and password"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              new Center(
                child: new RaisedButton(
                  child: const Text('Login'),
                  onPressed: () {

                    return _signIn(email.text, password.text)
                        .then((UserCredential result) =>
                        Navigator.of(context).pushReplacementNamed('/firebase'))
                        .catchError((e) => print(e));
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: const Text('create new account'),
                  onPressed: () {
                    return createUserWithEmailAndPassword(email.text, password.text)
                        .then((UserCredential result) => Navigator.of(context).pushReplacementNamed('/firebase'))
                        .catchError((e) => print(e));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("email", email.text);
      sharedPreferences.setString("password", password.text);
      getCredential();
    });
  }

  getCredential() async {//ユーザ情報を起動時に取得、checkValueによって判断
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          email.text = sharedPreferences.getString("email");
          password.text = sharedPreferences.getString("password");
        } else {
          email.clear();
          password.clear();
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }


}