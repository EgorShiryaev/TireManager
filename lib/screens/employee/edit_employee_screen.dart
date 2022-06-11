import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import '../../models/employee.dart';
import '../../widgets/employees_screen/employee_form.dart';

class EditEmployeeScreen extends StatelessWidget {
  final Employee employee;
  const EditEmployeeScreen({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.initials),
        centerTitle: true,
      ),
      body: EmployeeForm(
        onPressButton: Provider.of<EmployeesProvider>(context).editEmployee,
        employee: employee,
      ),
    );
  }
}
