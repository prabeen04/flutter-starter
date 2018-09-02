import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../models/contact.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String _color = '';
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  Contact newContact = new Contact();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Create Contact',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Name',
                    ),
                  ),
                  new Row(children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        labelText: 'Date of Birth',
                      ),
                      controller: _controller,
                      keyboardType: TextInputType.datetime,
                    )),
                    new IconButton(
                      icon: new Icon(Icons.more_horiz),
                      tooltip: 'Choose date',
                      onPressed: (() {
                        _chooseDate(context, _controller.text);
                      }),
                    )
                  ]),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      // WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.color_lens),
                      labelText: 'Color',
                    ),
                    isEmpty: _color == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _color,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _color = newValue;
                          });
                        },
                        items: _colors.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: RaisedButton(
                        child: const Text('Submit'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
