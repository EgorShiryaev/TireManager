import 'package:flutter/material.dart';
import 'package:tire_manager/widgets/no_data_center_text.dart';

import '../../models/order.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final List<Order> orders;
  const OrdersListView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const NoDataCenterText();
    }
    return ListView.separated(
      itemBuilder: (_, index) => OrderCard(order: orders[index]),
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: orders.length,
    );
  }
}
