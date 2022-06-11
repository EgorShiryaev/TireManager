import 'package:flutter/material.dart';

import '../../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${service.id!}'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(service.title)),
          Text('${service.price.toStringAsFixed(2)} ₽')
        ],
      ),
    );
  }
}
