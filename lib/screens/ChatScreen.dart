import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  // final TextEditingController _textController ;
  @override
  _ChatScreenState createState() {
    return new _ChatScreenState();
  }
}

class _LoginData {
  String email = '';
  String password = '';
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Chats')),
      body: 
    ));
  }
}
