import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Chat'),),
      body: Center(
        child: Text('Chat Screen'),
      ),
      )
    );
  }
}