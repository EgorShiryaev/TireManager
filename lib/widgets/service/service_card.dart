import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import 'package:tire_manager/screens/service/edit_service_screen.dart';
import 'package:tire_manager/widgets/dismissible_card.dart';
import '../../models/service.dart';
import '../../utils/create_route.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  void onDismissed() {
    Provider.of<ServicesProvider>(context, listen: false)
        .deleteService(widget.service);
  }

  void onTapCard() {
    Navigator.push(
      context,
      createRoute(context, EditServiceScreen(service: widget.service)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleCard(
      onDismissed: onDismissed,
      id: widget.service.id!,
      onTapCard: onTapCard,
      cardContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(widget.service.title)),
          Text('${(widget.service.price / 100).toStringAsFixed(2)} ₽')
        ],
      ),
    );
  }
}
