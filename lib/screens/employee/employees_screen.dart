import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/screens/employee/create_employee_screen.dart';
import 'package:tire_manager/utils/create_route.dart';
import '../../widgets/index.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  void _addService() {
    Navigator.push(context, createRoute(context, const CreateEmployeeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Персонал')),
      body: Consumer<EmployeesProvider>(builder: (context, value, child) {
        return EmployeesListView(employees: value.employees);
      }),
      floatingActionButton: FloatingAddButton(onPress: _addService),
    );
  }
}
