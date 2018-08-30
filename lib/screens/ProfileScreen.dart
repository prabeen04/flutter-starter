import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final String _title = 'Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_title),
            ),
            body: Container(
              child: Center(
                child: Text(_title)
              ),
            ),
        );
  }
}
