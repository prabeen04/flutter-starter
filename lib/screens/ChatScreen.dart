import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _textController ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Chats')),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _textController,
                  maxLines: null,
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){},
                )
              ],
            )),
      ),
    );
  }
}
