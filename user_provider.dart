import 'package:flutter/material.dart';



class UserProvider with ChangeNotifier {
  String _name = '';
  String _surname = '';
  String _email = '';
  String _phone = '';
  String _password = '';

  void register({
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String password,
  }) {
    _name = name;
    _surname = surname;
    _email = email;
    _phone = phone;
    _password = password;
    notifyListeners();
  }

  bool login(String email, String password) {
    return _email == email && _password == password;
  }

  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  String get phone => _phone;
}
