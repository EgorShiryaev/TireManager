import 'package:flutter/material.dart';

import '../../models/service.dart';
import '../index.dart';

class ServicesListView extends StatelessWidget {
  final List<Service> services;
  const ServicesListView({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const NoDataCenterText();
    }
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (_, index) => ServiceCard(service: services[index]),
        itemCount: services.length,
      ),
    );
  }
}
