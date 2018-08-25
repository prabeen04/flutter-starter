import 'package:flutter/material.dart';
import './screens/MainScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.greenAccent,
        accentColor: Colors.redAccent
      ),
      home: new MainScreen(title: 'Prabeen'),
    );
  }
}

