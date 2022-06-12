import 'package:flutter/material.dart';
import 'package:tire_manager/widgets/no_data_center_text.dart';

import '../../models/employee.dart';
import 'employee_card.dart';

class EmployeesListView extends StatelessWidget {
  final List<Employee> employees;
  const EmployeesListView({
    Key? key,
    required this.employees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (employees.isEmpty) {
      return const NoDataCenterText();
    }
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (_, index) => EmployeeCard(employee: employees[index]),
        itemCount: employees.length,
      ),
    );
  }
}
