import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Notifications'),),
      body: Center(
        child: Text('Notification Screen'),
      ),
      )
    );
  }
}