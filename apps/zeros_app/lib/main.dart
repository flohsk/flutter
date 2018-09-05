import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zeros App',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Zeros app"),
        ),
        body: Board(),
      ),
    );
  }
}

class Board extends StatefulWidget{
  Board({ Key key }) : super(key: key);
  @override
  _BoardState createState() => new _BoardState();
}

class _BoardState extends State<Board>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 8,
      primary: false,
      padding: EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      children: iconGenerator(),
    );
  }

  List<Widget> nodeGenerator({int row = 8, int column = 15}){
    List<Widget> iconList = new List<Widget>();
    for (int i = 0; i < row*column; i++){
      iconList.add(Node(id: i, ));
    }
    return iconList;
  }
}

class Node extends StatefulWidget{
  final int id;
  final Offset position;
  final List<int> listIdNeighbours;

  Node({this.id, this.position, this.listIdNeighbours});

  @override
  _NodeState createState() => _NodeState();
}

class _NodeState extends State<Node>{

  Color nodeColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: widget.position.dx,
      top: widget.position.dy,
      child: Draggable(
          child: DragTarget(
              builder: (BuildContext context,
                List<dynamic> accepted,
                  List<dynamic> rejected){
                return Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: nodeColor
                  ),
                )

              },
              onAccept: (int id){
                setState(() {
                  if(id + 1 == widget.id){
                    nodeColor = Colors.red;
                  }
                });
              },
          ),
          feedback: Container(
            width: 20.0,
            height: 20.0,
            color: nodeColor.withOpacity(0.5),
          ),
          data: widget.id,
      ),
    );
  }
}

List<int> createListNeighbour(int row, int column, int id){
  List<int> listNeighbours = new List<int>();
  if(id - row >= 0 && id + row <= row*column && id%8 != 0 && id%8 != 7){
    listNeighbours.add(id+1);
    listNeighbours.add(id-1);
    listNeighbours.add(id+8);
    listNeighbours.add(id-8);
  }else if()
}