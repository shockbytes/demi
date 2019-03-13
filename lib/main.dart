import 'package:demi/data/firebase_login_repository.dart';
import 'package:demi/data/login_repository.dart';
import 'package:demi/model/demi_user.dart';
import 'package:demi/ui/TodayWidget.dart';
import 'package:demi/ui/TomorrowWidget.dart';
import 'package:demi/ui/WeekWidget.dart';
import 'package:demi/ui/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demi',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black))),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Define dependencies here
  LoginRepository _loginRepository = FirebaseLoginRepository(GoogleSignIn(), FirebaseAuth.instance);
  String _url = "";

  final List<Widget> _children = [
    TodayWidget(),
    TomorrowWidget(),
    WeekWidget()
  ];

  void _onOverflowSelected(OverflowState state) {
    Fluttertoast.showToast(
        msg: state.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  @override
  void initState() {
    super.initState();

    _loginRepository.signIn().then((DemiUser user) {
      print(user);
      setState(() {
        _url = user.photoUrl;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: new Center(
                child: Text(widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              actions: [

                PopupMenuButton<OverflowState>(
                  icon: Icon(Icons.more_vert, color: Colors.black,),
                  onSelected: _onOverflowSelected,
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<OverflowState>>[
                    const PopupMenuItem<OverflowState>(
                      value: OverflowState.LOGOUT,
                      child: Text('Logout'),
                    ),
                    const PopupMenuItem<OverflowState>(
                      value: OverflowState.SETTINGS,
                      child: Text('Settings'),
                    ),
                  ],
                )
              ],
              leading: Container(
                margin: EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(_url),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.today), text: "Today",),
                  Tab(icon: Icon(Icons.plus_one), text: "Tomorrow",),
                  Tab(icon: Icon(Icons.view_week), text: "Week",),
                ],
                labelColor: Colors.black,
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: _children,
            )
        )
    );
  }
}

enum OverflowState { LOGOUT, SETTINGS, }
