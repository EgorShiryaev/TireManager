import 'package:flutter/material.dart';

import '../../models/order.dart';
import 'order_widget.dart';

class OrdersListView extends StatelessWidget {
  final List<Order> orders;
  const OrdersListView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Text(
            'Нет данных!\nДля добавления нажмите кнопку в правом нижнем углу!',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.separated(
      itemBuilder: (_, index) => OrderWidget(order: orders[index]),
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: orders.length,
    );
  }
}
