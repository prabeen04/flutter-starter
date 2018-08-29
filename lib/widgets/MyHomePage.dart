import 'package:flutter/material.dart';
import '../screens/ProfileScreen.dart';
import '../screens/NewsScreen.dart';
import '../screens/NotificationScreen.dart';
import './FABIcon.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.notifications,
                color: Colors.black38,
              ),
              tooltip: 'Notifications',
              onPressed: () {
                print('Notification Icon Pressed');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NotificationScreen()));
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.settings,
                color: Colors.black38,
              ),
              tooltip: 'Settings',
              onPressed: () {
                print('Settings Icon Pressed');
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.account_circle,
                color: Colors.black38,
              ),
              tooltip: 'Profile',
              onPressed: () {
                print('Settings Icon Pressed');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        'https://i.ytimg.com/vi/xwa1cBWWCVY/hqdefault.jpg'),
                  ),
                  accountName: Text(
                    "Prabeen",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  accountEmail: Text(
                    "prabeen.strange@gmail.com",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  )),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProfileScreen()));
                },
              ),
              ListTile(
                title: Text('News'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NewsScreen()));
                },
              ),
            ],
          ),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/chain.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Stack(
            children: <Widget>[
              Image.asset("assets/images/chain.jpg", 
              fit: BoxFit.fill,
              // width: 500.0,
              ),
            ],
          ),
        ),
        // Bottom Navigator Starts here!!

        // App level floating action Button!!
        floatingActionButton:
            FancyFab() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
