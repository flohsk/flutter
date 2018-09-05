import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
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
        appBar: AppBar(title: Text("Drag Drop"),),
        body: App(),
      )
    );
  }
}

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {

  Color caughtColor;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: <Widget>[
        DragBox(Offset(0.0, 0.0), "Box one", Colors.lime),
        DragBox(Offset(100.0, 100.0), "Box two", Colors.orange),
        Positioned(
          left: 100.0,
          bottom: 0.0,
          child: DragTarget(
              onAccept: (Color color){
                caughtColor = color;
              },
              builder: (BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,)
              {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text("Drag here!"),
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}

class DragBox extends StatefulWidget{
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox>{
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              )
            ),
          ),
          feedback: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset){
            setState(() {
              position = offset;
            });
          },),
    );
  }
}
