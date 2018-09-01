import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:simple_permissions/simple_permissions.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _title = 'Profile';
  Permission permission;
  Iterable<Contact> _contacts;
  @override
  initState() {
    super.initState();
    checkPermission();
  }

  requestPermission() async {
    bool res =
        await SimplePermissions.requestPermission(Permission.ReadContacts);
    print("permission request result is " + res.toString());
    checkPermission();
  }

  checkPermission() async {
    print('Inside checkPermission()');
    bool res = await SimplePermissions.checkPermission(Permission.ReadContacts);
    print(res);
    if (res == true) {
      debugPrint('Permission granted');
      refreshContacts();
    } else {
      debugPrint('No Permission');
      requestPermission();
    }
  }

  getPermissionStatus() async {
    final res =
        await SimplePermissions.getPermissionStatus(Permission.ReadContacts);
    print("permission status is " + res.toString());
  }

  refreshContacts() async {
    var contacts = await ContactsService.getContacts();
    print(contacts);
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/add").then((_) {
              refreshContacts();
            });
          }),
      body: SafeArea(
          child: _contacts != null
              ? ListView.builder(
                  itemCount: _contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact c = _contacts?.elementAt(index);
                    return ListTile(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         ContactDetailsPage(c)));
                      },
                      leading: (c.avatar != null && c.avatar.length > 0)
                          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
                          : CircleAvatar(
                              child: Text(c.displayName.length > 1
                                  ? c.displayName?.substring(0, 2)
                                  : "")),
                      title: Text(c.displayName ?? ""),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
