import 'package:flutter/material.dart';
import '../screens/ProfileScreen.dart';
import '../screens/NewsScreen.dart';
import '../screens/FormScreen.dart';
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
            ListTile(
              title: Text('Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => FormScreen()));
              },
            ),
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/chain.jpg'),
              fit: BoxFit.cover,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  'Welcome Prabeen',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                alignment: AlignmentDirectional.center,
                child: Text(
                  '20:20',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 48.0),
                )),
          ],
        ),
        // Bottom Navigator Starts here!!

        // App level floating action Button!!
        floatingActionButton:
            FancyFab() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
