import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import '../../models/service.dart';
import '../../widgets/index.dart';

class EditServiceScreen extends StatelessWidget {
  final Service service;
  const EditServiceScreen({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.title)),
      body: ServiceForm(
        onPressButton: Provider.of<ServicesProvider>(context).editService,
        service: service,
      ),
    );
  }
}
