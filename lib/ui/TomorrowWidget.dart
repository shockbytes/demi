import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TomorrowWidget extends StatelessWidget {
  List<Widget> _content = [
    InkWell(
      onTap: () {},
      child: ListTile(
        title: Text("1600 Standup"),
        subtitle: Text("What to add here?"),
        trailing: Icon(Icons.drag_handle),
        leading: Checkbox(value: false, onChanged: (value) {}),
      ),
    ),
    InkWell(
      onTap: () {},
      child: ListTile(
        title: Text("1700 Meeting"),
        subtitle: Text("What to add here?"),
        trailing: Icon(Icons.drag_handle),
        leading: Checkbox(value: true, onChanged: (value) {}),
      ),
    ),
    Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
              ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            onPressed: () {

            },
            elevation: 0,
            mini: true,
          ),
        )
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListView(
        key: Key("ls_tomorrow"),
        children: _content,
      ),
    );
  }
}
