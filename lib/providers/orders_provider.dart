import 'package:flutter/material.dart';

import '../datasources/local_datasource.dart';
import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {
  final LocalDatasource datasource;

  OrdersProvider({required this.datasource});

  List<Order> get orders => datasource.orders;

  void addOrder(Order order) {
    datasource.addOrder(order);
    notifyListeners();
  }

  void updateOrder(Order order) {
    datasource.updateOrder(order);
    notifyListeners();
  }

  void deleteOrder(Order order) {
    datasource.deleteOrder(order.orderNumber!);
  }
}
