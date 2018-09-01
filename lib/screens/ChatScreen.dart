import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

class ChatScreen extends StatefulWidget {
  // final TextEditingController _textController ;
  @override
  _ChatScreenState createState() {
    return _ChatScreenState();
  }
}

class _LoginData {
  String email = '';
  String password = '';
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _LoginData _data = _LoginData();
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

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(title: Text('Chats')),
            body: Container(
              margin: const EdgeInsets.all(20.0),
                child: Form(
              key: this._formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: InputDecoration(labelText: 'E-mail Address'),
                      validator: this._validateEmail,
                      onSaved: (String value) {
                        this._data.email = value;
                      }),
                  TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration:
                          InputDecoration(labelText: 'Enter your password'),
                      validator: this._validatePassword,
                      onSaved: (String value) {
                        this._data.password = value;
                      }),
                  Container(
                    width: screenSize.width,
                    child: RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: this.submit,
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
            ))));
  }
}
