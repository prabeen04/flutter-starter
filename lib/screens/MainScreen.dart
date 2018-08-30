import 'package:flutter/material.dart';
import '../widgets/MyHomePage.dart';
import './MessagesScreen.dart';
import './ProfileScreen.dart';
import './NewsScreen.dart';
import './ChatScreen.dart';
import './SettingsScreen.dart';
import './NotificationScreen.dart';
import '../widgets/placeholder.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomePage(),
    MessagesScreen(),
    ChatScreen(),
    NotificationScreen(),
    SettingsScreen()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://i.ytimg.com/vi/xwa1cBWWCVY/hqdefault.jpg'),
                ),
                accountName: Text(
                  "Prabeen",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                accountEmail: Text(
                  "prabeen.strange@gmail.com",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
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
      body: _children[_currentIndex], // new
      // Bottom Navigator Starts here!!

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
               title: Text('Settings'
               ))
        ],
      ),
    );
  }
}
