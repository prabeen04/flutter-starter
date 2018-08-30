import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final String _title = 'Profile';
  Iterable<Contact> _contacts;
  @override
  initState() {
    super.initState();
    refreshContacts();
  }

  refreshContacts() async {
    var contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

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
