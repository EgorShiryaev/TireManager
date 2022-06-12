import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/screens/employee/edit_employee_screen.dart';
import 'package:tire_manager/utils/create_route.dart';
import 'package:tire_manager/widgets/dismissible_card.dart';

class EmployeeCard extends StatefulWidget {
  final Employee employee;
  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  void onDismissed() {
    Provider.of<EmployeesProvider>(context, listen: false)
        .deleteEmployee(widget.employee);
  }

  void onTapCard() {
    Navigator.push(
      context,
      createRoute(context, EditEmployeeScreen(employee: widget.employee)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleCard(
      onDismissed: onDismissed,
      onTapCard: onTapCard,
      id: widget.employee.id!,
      cardContent: Text(
        widget.employee.initials,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
