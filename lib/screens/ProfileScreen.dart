import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile'),
            ),
            body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[],
              title: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              children: [
                Icon(Icons.directions_car,size: 50.0,),
                Icon(Icons.directions_transit,size: 50.0,),
                Icon(Icons.directions_bike,size: 50.0,),
              ],
            ),
          ),
        )
        );
  }
}
