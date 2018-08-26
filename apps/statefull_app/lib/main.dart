import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Change Color"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[Expanded(
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: new PlayerPoints(),
              )
            ),
          ), Expanded(
            child: Container(
              color: Colors.red,
              child: Center(
                child: new PlayerPoints(),
              ),
            ),
          )],
        ),
      )
    );
  }
}

class PlayerPoints extends StatefulWidget{
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints>{
  int _playerPoints = 0;

  void _increment(){
    setState(() {
      _playerPoints = _playerPoints + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _increment,
      child: Text("$_playerPoints points."),
    );
  }
}

