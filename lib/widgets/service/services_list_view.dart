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
      child: ListView.separated(
        itemBuilder: (_, index) => ServiceCard(service: services[index]),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: services.length,
      ),
    );
  }
}
