import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

class ChatScreen extends StatefulWidget {
  // final TextEditingController _textController ;
  @override
  _ChatScreenState createState() {
    return new _ChatScreenState();
  }
}

class _LoginData {
  String email = '';
  String password = '';
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }
  @override
  Widget build(BuildContext context) {
        final Size screenSize = MediaQuery.of(context).size;

    return Container(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Chats')),
      body: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'you@example.com',
                  labelText: 'E-mail Address'
                ),
                validator: this._validateEmail,
                onSaved: (String value) {
                  this._data.email = value;
                }
              ),
              new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Password',
                  labelText: 'Enter your password'
                ),
                validator: this._validatePassword,
                onSaved: (String value) {
                  this._data.password = value;
                }
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Login',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: this.submit,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        )
    ));
  }
}
