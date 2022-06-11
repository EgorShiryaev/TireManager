import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/screens/employee/create_employee_screen.dart';
import 'package:tire_manager/utils/create_route.dart';
import 'package:tire_manager/widgets/employees_screen/employee_widget.dart';

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
      appBar: AppBar(
        title: const Text('Персонал'),
        centerTitle: true,
      ),
      body: Consumer<EmployeesProvider>(
        builder: (context, value, child) {
          final employees = value.employees;
          if (employees.isEmpty) {
            return const Center(
              child: Text(
                'Нет данных!\nДля добавления нажмите кнопку в правом нижнем углу!',
                textAlign: TextAlign.center,
              ),
            );
          }
          return SafeArea(
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  EmployeeWidget(employee: employees[index]),
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemCount: employees.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addService,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}