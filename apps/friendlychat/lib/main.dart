import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Friendlychat",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Friendlychat"),
        ),
      )
    )
  );
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{

  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text){
    _textController.clear();
  }

  Widget _buildTextComposer(){
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _textController,
        onSubmitted: _handleSubmitted,
        decoration: InputDecoration.collapsed(
            hintText: "Send a message"
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendlchat"),
      ),
      body: _buildTextComposer(),
    );
  }
}