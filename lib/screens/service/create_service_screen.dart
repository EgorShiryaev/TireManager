import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import '../../widgets/index.dart';


class CreateServiceScreen extends StatelessWidget {
  const CreateServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новая услуга')),
      body: ServiceForm(
        onPressButton: Provider.of<ServicesProvider>(context).addService,
      ),
    );
  }
}
