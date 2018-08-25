import 'package:flutter/material.dart';
import '../screens/ProfileScreen.dart';
import '../screens/NewsScreen.dart';
import '../screens/NotificationScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
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
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
            ),
            Text(
              'Click as many times you want',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),

      // Bottom Navigator Starts here!!

      // App level floating action Button!!
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
