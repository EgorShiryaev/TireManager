import 'package:flutter/material.dart';
import 'package:tire_manager/models/user.dart';

import '../datasources/local_datasource.dart';

final users = [
  User(username: 'admin', password: 'admin'),
  User(username: 'newAdmin', password: 'newAdmin'),
];

class AuthProvider extends ChangeNotifier {
  final LocalDatasource datasource;

  AuthProvider({required this.datasource});

  bool get userIsAuth => datasource.userIsAuth;

  void authorizate(String username, String password) {
    bool success = false;
    users.forEach((element) {
      if (element.username == username && element.password == password) {
        success = true;
      }
    });
    datasource.userIsAuth = success;
    notifyListeners();
  }
}
