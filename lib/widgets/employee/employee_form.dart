import 'package:flutter/material.dart';

import '../../models/employee.dart';
import '../index.dart';

class EmployeeForm extends StatefulWidget {
  final Employee? employee;
  final void Function(Employee emp) onPressButton;
  const EmployeeForm({
    Key? key,
    this.employee,
    required this.onPressButton,
  }) : super(key: key);

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final surnameController = TextEditingController();
  final surnameFocusNode = FocusNode();
  final fatherNameController = TextEditingController();
  final fatherNameFocusNode = FocusNode();

  @override
  void initState() {
    final startEmployee = widget.employee;
    if (startEmployee != null) {
      nameController.text = startEmployee.name;
      surnameController.text = startEmployee.surname;
      fatherNameController.text = startEmployee.fatherName;
    }
    super.initState();
  }

  List<String> _generateFormValidateErrors() {
    final errors = <String>[];
    if (nameController.text == '') {
      errors.add('"Фамилия" должно быть заполнено');
    }
    if (surnameController.text == '') {
      errors.add('"Имя" должно быть заполнено');
    }
    if (fatherNameController.text == '') {
      errors.add('"Отчество" должно быть заполнено');
    }
    return errors;
  }

  void onPressButton() {
    final errors = _generateFormValidateErrors();
    if (errors.isEmpty) {
      var newEmployee = Employee(
        name: nameController.text,
        surname: surnameController.text,
        fatherName: fatherNameController.text,
      );
      if (widget.employee != null) {
        newEmployee.id = widget.employee!.id;
      }
      widget.onPressButton(newEmployee);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errors.join('\n\n')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextField(
                controller: surnameController,
                focusNode: surnameFocusNode,
                hintText: 'Фамилия',
              ),
              CustomTextField(
                controller: nameController,
                focusNode: nameFocusNode,
                hintText: 'Имя',
              ),
              CustomTextField(
                controller: fatherNameController,
                focusNode: fatherNameFocusNode,
                hintText: 'Отчество',
              ),
            ],
          ),
          CustomElevatedButton(
            onPressed: onPressButton,
            title: 'Сохранить',
          ),
        ],
      ),
    );
  }
}
