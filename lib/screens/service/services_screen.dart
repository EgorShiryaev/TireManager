import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import 'package:tire_manager/screens/service/create_service_screen.dart';
import '../../utils/create_route.dart';
import '../../widgets/index.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  void _addService() {
    Navigator.push(context, createRoute(context, const CreateServiceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Услуги')),
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
