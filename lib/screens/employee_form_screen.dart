import 'package:flutter/material.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/widgets/widgets.dart';

class EmployeeFormScreen extends StatefulWidget {
  final Employee? employee;
  final void Function(Employee emp) save;
  const EmployeeFormScreen({
    Key? key,
    this.employee,
    required this.save,
  }) : super(key: key);

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
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

  void onSave() {
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
      widget.save(newEmployee);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee?.initials ?? 'Добавление сотрудника'),
        centerTitle: true,
      ),
      body: SafeArea(
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
              onPressed: onSave,
              title: 'Сохранить',
            ),
          ],
        ),
      ),
    );
  }
}
