import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/providers/employees_provider.dart';

import '../../screens/employee_form_screen.dart';

class EmployeeWidget extends StatefulWidget {
  final Employee employee;
  const EmployeeWidget({Key? key, required this.employee}) : super(key: key);

  @override
  State<EmployeeWidget> createState() => _EmployeeWidgetState();
}

class _EmployeeWidgetState extends State<EmployeeWidget> {
  void onDismissed(_) {
    Provider.of<EmployeesProvider>(context, listen: false)
        .deleteEmployee(widget.employee);
  }

  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeFormScreen(
          employee: widget.employee,
          save: Provider.of<EmployeesProvider>(context).updateEmployee,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
          size: 32.0,
        ),
      ),
      direction: DismissDirection.endToStart,
      key: Key('${widget.employee.id!}'),
      onDismissed: onDismissed,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Text(
            widget.employee.initials,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
