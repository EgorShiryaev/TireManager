import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import '../../widgets/services_screen/service_widget.dart';

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
      body: Consumer<ServicesProvider>(
        builder: (context, value, child) {
          final services = value.services;
          if (services.isEmpty) {
            return const Center(
              child: Text(
                'Нет данных!\nДля добавления нажмите кнопку в правом нижнем углу!',
                textAlign: TextAlign.center,
              ),
            );
          }
          return SafeArea(
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  ServiceWidget(service: services[index]),
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemCount: services.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addService,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
