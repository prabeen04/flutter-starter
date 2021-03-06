import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return json.decode(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(      
        appBar: AppBar(
          title: Text("Messages"),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
            child: Center(
                child: FutureBuilder(
              future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                   itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 8.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text(snapshot.data[index]['title'][0].toString().toUpperCase(), 
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                        ),
                        title: Text(snapshot.data[index]['title'].toString().toUpperCase()),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ))),
      ),
    );
  }
}
