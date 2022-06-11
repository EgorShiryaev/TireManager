import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/models/order.dart';
import 'package:tire_manager/models/order_status.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/screens/order/order_form_screen.dart';
import 'package:tire_manager/widgets/orders_screen/orders_list_view.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  _addOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Заказы'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'В процессе'),
              Tab(text: 'История'),
            ],
          ),
        ),
        body: Consumer<OrdersProvider>(
          builder: (context, value, _) {
            final inProcessOrders = <Order>[];
            final history = <Order>[];
            value.orders.forEach((element) =>
                element.status == OrderStatus.issued
                    ? history.add(element)
                    : inProcessOrders.add(element));
            return TabBarView(
              children: [
                OrdersListView(orders: inProcessOrders),
                OrdersListView(orders: history),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addOrder,
          child: const Icon(Icons.add, size: 32),
        ),
      ),
    );
  }
}
