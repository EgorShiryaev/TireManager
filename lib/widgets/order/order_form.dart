import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/models/order_status.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import 'package:tire_manager/utils/datetime_helper.dart';
import 'package:tire_manager/widgets/index.dart';
import 'package:tire_manager/widgets/order/dropdown_field.dart';
import '../../models/order.dart';
import '../../models/service.dart';
import '../padding_wrapper.dart';

class OrderForm extends StatefulWidget {
  final Order? order;
  final void Function(Order order) onPressButton;
  const OrderForm({
    Key? key,
    this.order,
    required this.onPressButton,
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

      issueDate = DateTimeHelper.convertDateTimeToDate(order.issueDateTime);
      issueTime =
          DateTimeHelper.convertDateTimeToTimeOfDay(order.issueDateTime);
    }
    super.initState();
  }

  void onSelectService(int? id) => setState(() =>
      selectedService = services.firstWhere((element) => element.id == id));

  void onSelectEmployee(int? id) => setState(() =>
      selectedEmployee = employees.firstWhere((element) => element.id == id));

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
      final issueDateTime = DateTimeHelper.convertDateAndTimeOfDayToDateTime(
        issueDate,
        issueTime,
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
          order.id!,
        );
      }
      widget.onPressButton(newOrder);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errors.join('\n\n')),
          duration: const Duration(milliseconds: 500),
        ),
      );
    }
  }

  void _changeStatus() {
    final order = widget.order!..updateStatus();
    Provider.of<OrdersProvider>(context, listen: false).editOrder(order);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          PaddingWrapper(
            child: CustomTextField(
              controller: clientNameController,
              focusNode: clientNameFocusNode,
              hintText: 'ФИО клиента',
            ),
          ),
          PaddingWrapper(
            child: CustomTextField(
              controller: clientPhoneController,
              focusNode: clientPhoneFocusNode,
              hintText: 'Телефон клиента',
            ),
          ),
          PaddingWrapper(
            child: CustomTextField(
              controller: carModelController,
              focusNode: carModelFocusNode,
              hintText: 'Модель машины',
            ),
          ),
          PaddingWrapper(
            child: DropdownField(
              values: services,
              emptyText: 'Нет данных об услугах!',
              notContainedSelectedValueText: 'Услуга не найдена',
              hintText: 'Выберите услугу',
              onSelect: onSelectService,
              selectedValue: selectedService,
            ),
          ),
          PaddingWrapper(
            child: DropdownField(
              values: employees,
              emptyText: 'Нет данных о сотрудниках!',
              notContainedSelectedValueText: 'Сотрудник не найден',
              hintText: 'Выберите сотрудника',
              onSelect: onSelectEmployee,
              selectedValue: selectedEmployee,
            ),
          ),
          PaddingWrapper(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    onPressed: _selectTime,
                    title: DateFormat.Hm('ru').format(
                      DateTime(2022, 1, 1, issueTime.hour, issueTime.minute),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: CustomElevatedButton(
                    onPressed: _selectDate,
                    title: DateFormat.yMMMMd('ru').format(issueDate),
                  ),
                ),
              ],
            ),
          ),
          PaddingWrapper(
            child: CustomElevatedButton(
              onPressed: _onPressButton,
              title: 'Сохранить',
            ),
          ),
          widget.order != null && widget.order?.status != OrderStatus.issued
              ? PaddingWrapper(
                  child: CustomElevatedButton(
                    onPressed: _changeStatus,
                    title: 'Изменить статус',
                  ),
                )
              : const SizedBox.shrink(),
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
