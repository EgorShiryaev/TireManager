import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import '../../widgets/index.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  void _addService() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Услуги'),
        centerTitle: true,
      ),
      body: Consumer<ServicesProvider>(builder: (context, value, child) {
        return ServicesListView(services: value.services);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addService,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
