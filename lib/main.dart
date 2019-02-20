import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Demi'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.white,
      ),

      body:
          Center(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
