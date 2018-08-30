import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text('Profile'),
      //       ),
            body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              actions: <Widget>[],
              title: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.verified_user)),
                  Tab(icon: Icon(Icons.settings)),
                  Tab(icon: Icon(Icons.search)),
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
