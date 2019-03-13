import 'package:demi/data/firebase_login_repository.dart';
import 'package:demi/data/login_repository.dart';
import 'package:demi/main.dart';
import 'package:demi/model/demi_user.dart';
import 'package:demi/presentation/demi_icons_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginRepository _loginRepository =
      FirebaseLoginRepository(GoogleSignIn(), FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 100, left: 100, right: 100, bottom: 30),
          child: Icon(
            Icons.check,
            color: Colors.redAccent,
            size: 128,
          ),
        ),
        Text(
          "Welcome to Demi",
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 100, bottom: 130),
          child: Center(
            child: RaisedButton(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(DemiIcons.google),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Login with Google",
                          textScaleFactor: 1.2,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
              textColor: Colors.white,
              color: Color(0xFFdd4b39),
              onPressed: () {
                _login();
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Made with"),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 20,
                ),
              ),
              Text("and"),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Image.network(
                  "https://avatars1.githubusercontent.com/u/1609975?s=200&v=4",
                  height: 20,
                  width: 20,
                ),
              ),
              Text(" & "),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: FlutterLogo(
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  _login() {
    _loginRepository.signIn().then((DemiUser user) {
      _navigateToMain();
    }).catchError((e) {
      print(e);
    });
  }

  _navigateToMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: 'Demi',
              )),
    );
  }
}
