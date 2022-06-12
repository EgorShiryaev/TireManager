import 'package:flutter/material.dart';
import 'package:tire_manager/models/service.dart';
import '../index.dart';

class ServiceForm extends StatefulWidget {
  final Service? service;
  final void Function(Service service) onPressButton;
  const ServiceForm({
    Key? key,
    this.service,
    required this.onPressButton,
  }) : super(key: key);

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final titleController = TextEditingController();
  final titleFocusNode = FocusNode();
  final priceController = TextEditingController();
  final priceFocusNode = FocusNode();

  @override
  void initState() {
    final startService = widget.service;
    if (startService != null) {
      titleController.text = startService.title;
      priceController.text = (startService.price / 100).toStringAsFixed(2);
    }
    super.initState();
  }

  List<String> _generateFormValidateErrors() {
    final errors = <String>[];
    if (titleController.text == '') {
      errors.add('"Название" должно быть заполнено');
    }
    if (priceController.text == '') {
      errors.add('"Стоимость" должна быть заполнено');
    } else if (double.tryParse(priceController.text) == null) {
      errors.add('"Стоимость" должна быть число');
    }

    return errors;
  }

  void onPressButton() {
    final errors = _generateFormValidateErrors();
    if (errors.isEmpty) {
      var newService = Service(
        title: titleController.text,
        price: (double.parse(priceController.text) * 100).toInt(),
      );
      if (widget.service != null) {
        newService.id = widget.service?.id;
      }
      widget.onPressButton(newService);
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
                controller: titleController,
                focusNode: titleFocusNode,
                hintText: 'Название',
              ),
              CustomTextField(
                controller: priceController,
                focusNode: priceFocusNode,
                hintText: 'Стоимость',
                keyboardType: TextInputType.number,
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
