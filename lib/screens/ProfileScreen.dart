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
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.directions_car)),
                  new Tab(icon: new Icon(Icons.directions_transit)),
                  new Tab(icon: new Icon(Icons.directions_bike)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: [
                new Icon(Icons.directions_car,size: 50.0,),
                new Icon(Icons.directions_transit,size: 50.0,),
                new Icon(Icons.directions_bike,size: 50.0,),
              ],
            ),
          ),
        )
        );
  }
}
