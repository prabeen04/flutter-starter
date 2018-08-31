import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  // final TextEditingController _textController ;
  @override
  _ChatScreenState createState() {
    return new _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Chats')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  labelText: 'E-mail Address'
                ),
              // controller: _textController,
              maxLines: null,
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            )
          ],
        )),
      ),
    ));
  }
}
