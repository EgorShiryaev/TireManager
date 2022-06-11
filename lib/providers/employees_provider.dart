import 'package:flutter/material.dart';

import '../datasources/local_datasource.dart';
import '../models/employee.dart';

class EmployeesProvider extends ChangeNotifier {
  final LocalDatasource datasource;

  EmployeesProvider({required this.datasource});

  List<Employee> get employees => datasource.employees;

  void addEmployee(Employee employee) {
    datasource.addEmployee(employee);
    notifyListeners();
  }

  void editEmployee(Employee employee) {
    datasource.updateEmployee(employee);
    notifyListeners();
  }

  void deleteEmployee(Employee employee) {
    datasource.deleteEmployee(employee.id!);
    notifyListeners();
  }
}
