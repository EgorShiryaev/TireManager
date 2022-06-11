import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/order.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/widgets/orders_screen/order_form.dart';

class OrderFormScreen extends StatefulWidget {
  final Order? order;
  const OrderFormScreen({Key? key, this.order}) : super(key: key);

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  void onSave(Order newOrder) {
    if (widget.order == null) {
      Provider.of<OrdersProvider>(context, listen: false).addOrder(newOrder);
    } else {
      Provider.of<OrdersProvider>(context, listen: false).updateOrder(newOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.order == null
            ? 'Новый заказ'
            : 'Заказ №${widget.order!.orderNumber}'),
        centerTitle: true,
      ),
      body: OrderForm(
        save: onSave,
        order: widget.order,
      ),
    );
  }
}
