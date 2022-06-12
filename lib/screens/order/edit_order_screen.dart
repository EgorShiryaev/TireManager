import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order.dart';
import '../../providers/orders_provider.dart';
import '../../widgets/index.dart';

class EditOrderScreen extends StatelessWidget {
  final Order order;
  const EditOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заказ #${order.id}')),
      body: OrderForm(
        onPressButton: Provider.of<OrdersProvider>(context).editOrder,
        order: order,
      ),
    );
  }
}
