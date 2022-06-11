import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/screens/order/create_order_screen.dart';
import 'package:tire_manager/utils/create_route.dart';
import '../../widgets/index.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  _addOrder() {
    Navigator.push(context, createRoute(context, const CreateOrderScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Заказы'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'В процессе'),
              Tab(text: 'История'),
            ],
          ),
        ),
        body: Consumer<OrdersProvider>(
          builder: (context, value, _) {
            return TabBarView(
              children: [
                OrdersListView(orders: value.orders.processing),
                OrdersListView(orders: value.orders.history),
              ],
            );
          },
        ),
        floatingActionButton: FloatingAddButton(onPress: _addOrder),
      ),
    );
  }
}
