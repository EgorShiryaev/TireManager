import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import '../../widgets/index.dart';

class CreateEmployeeScreen extends StatelessWidget {
  const CreateEmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавление сотрудника')),
      body: EmployeeForm(
        onPressButton: Provider.of<EmployeesProvider>(context).addEmployee,
      ),
    );
  }
}
