import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/models/order_status.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import 'package:tire_manager/widgets/widgets.dart';

import '../../models/order.dart';
import '../../models/service.dart';

class OrderForm extends StatefulWidget {
  final Order? order;
  final void Function(Order order) save;
  const OrderForm({
    Key? key,
    this.order,
    required this.save,
  }) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final clientNameController = TextEditingController();
  final clientNameFocusNode = FocusNode();

  final clientPhoneController = TextEditingController();
  final clientPhoneFocusNode = FocusNode();

  final carModelController = TextEditingController();
  final carModelFocusNode = FocusNode();

  Service? selectedService;
  Employee? selectedEmployee;

  DateTime issueDate = DateTime.now();
  TimeOfDay issueTime = const TimeOfDay(hour: 12, minute: 0);

  List<Service> services = [];
  List<Employee> employees = [];

  @override
  void initState() {
    initializeDateFormatting();
    services = Provider.of<ServicesProvider>(context, listen: false).services;
    employees =
        Provider.of<EmployeesProvider>(context, listen: false).employees;

    final order = widget.order;
    if (order != null) {
      clientNameController.text = order.clientName;
      clientPhoneController.text = order.clientPhone;
      carModelController.text = order.carModel;
      selectedService = order.service;
      selectedEmployee = order.employee;
      issueDate = DateTime(
        order.issueDateTime.year,
        order.issueDateTime.month,
        order.issueDateTime.day,
      );
      issueTime = TimeOfDay(
        hour: order.issueDateTime.hour,
        minute: order.issueDateTime.minute,
      );
    }
    super.initState();
  }

  void onSelectService(Service? service) =>
      setState(() => selectedService = service);

  void onSelectEmployee(Employee? employee) =>
      setState(() => selectedEmployee = employee);

  final Widget _divider = const SizedBox(height: 10);

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      cancelText: 'Отмена',
      confirmText: 'Готово',
      helpText: 'Выберите дату',
      initialDate: issueDate,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (newDate != null) {
      setState(() => issueDate = newDate);
    }
  }

  Future<void> _selectTime() async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: issueTime,
      cancelText: 'Отмена',
      confirmText: 'Готово',
      helpText: 'Выберите время',
    );
    if (newTime != null) {
      setState(() => issueTime = newTime);
    }
  }

  List<String> _generateFormValidateErrors() {
    final errors = <String>[];
    if (clientNameController.text == '') {
      errors.add('"Фио клиента" должно быть заполнено');
    }
    if (clientPhoneController.text == '') {
      errors.add('"Телефон клиента" должно быть заполнено');
    }
    if (carModelController.text == '') {
      errors.add('"Модель машины" должно быть заполнено');
    }
    if (selectedService == null) {
      errors.add('"Услуга" должна быть выбрана');
    }
    if (selectedEmployee == null) {
      errors.add('"Сотрудник" должен быть выбран');
    }
    return errors;
  }

  void _onPressButton() {
    final errors = _generateFormValidateErrors();
    if (errors.isEmpty) {
      final issueDateTime = DateTime(
        issueDate.year,
        issueDate.month,
        issueDate.day,
        issueTime.hour,
        issueTime.minute,
      );

      var newOrder = Order(
        status: OrderStatus.inProcess,
        carModel: carModelController.text,
        clientName: clientNameController.text,
        clientPhone: clientPhoneController.text,
        issueDateTime: issueDateTime,
        service: selectedService!,
        startDateTime: DateTime.now(),
        employee: selectedEmployee!,
      );

      final order = widget.order;
      if (order != null) {
        newOrder.setStatusStartDateOrderNumber(
          order.status,
          order.startDateTime,
          order.orderNumber!,
        );
      }
      widget.save(newOrder);
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
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          CustomTextField(
            controller: clientNameController,
            focusNode: clientNameFocusNode,
            hintText: 'Фио клиента',
          ),
          _divider,
          CustomTextField(
            controller: clientPhoneController,
            focusNode: clientPhoneFocusNode,
            hintText: 'Телефон клиента',
          ),
          _divider,
          CustomTextField(
            controller: carModelController,
            focusNode: carModelFocusNode,
            hintText: 'Модель машины',
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<Service>(
              style: const TextStyle(fontSize: 20),
              hint: const Text('Услуга'),
              value: selectedService,
              isExpanded: true,
              items: services
                  .map((e) => DropdownMenuItem<Service>(
                        value: e,
                        child: Text(
                          e.title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
              onChanged: onSelectService,
            ),
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<Employee>(
              style: const TextStyle(fontSize: 20),
              hint: const Text('Сотрудник'),
              value: selectedEmployee,
              isExpanded: true,
              items: employees
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.initials,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
              onChanged: onSelectEmployee,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _selectTime,
                    child: Center(
                      child: Text(
                        DateFormat.Hm('ru').format(
                          DateTime(
                              2022, 1, 1, issueTime.hour, issueTime.minute),
                        ),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: _selectDate,
                    child: Center(
                      child: Text(
                        DateFormat.yMMMMd('ru').format(issueDate),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            onPressed: _onPressButton,
            title: 'Сохранить',
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    clientNameController.dispose();
    clientNameFocusNode.dispose();
    clientPhoneController.dispose();
    clientPhoneFocusNode.dispose();
    carModelController.dispose();
    carModelFocusNode.dispose();
    super.dispose();
  }
}
