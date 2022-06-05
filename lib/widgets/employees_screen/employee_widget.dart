import 'package:flutter/material.dart';
import 'package:tire_manager/models/employee.dart';

class EmployeeWidget extends StatelessWidget {
  final Employee employee;
  const EmployeeWidget({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${employee.id!}'),
      child: Text(employee.initials),
    );
  }
}
