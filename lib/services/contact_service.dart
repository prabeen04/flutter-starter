import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../models/contact.dart';

class ContactService {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<Contact> createContact(Contact contact) async {
    try {
      String _json = _toJson(contact);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: _json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Contact _fromJson(String __json) {
    Map<String, dynamic> map = json.decode(__json);
    var contact = new Contact();
    contact.name = map['name'];
    contact.dob = new DateFormat.yMd().parseStrict(map['dob']);
    contact.phone = map['phone'];
    contact.email = map['email'];
    contact.email = map['favoriteColor'];
    return contact;
  }

  String _toJson(Contact contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["dob"] = new DateFormat.yMd().format(contact.dob);
    mapData["phone"] = contact.phone;
    mapData["email"] = contact.email;
    mapData["favoriteColor"] = contact.favoriteColor;
    String __json = json.encode(mapData);
    return __json;
  }
}