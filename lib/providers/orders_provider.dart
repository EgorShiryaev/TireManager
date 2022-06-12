import 'package:flutter/material.dart';

import '../datasources/local_datasource.dart';
import '../models/order.dart';
import '../models/order_status.dart';
import '../models/substracted_orders.dart';

class OrdersProvider extends ChangeNotifier {
  final LocalDatasource datasource;

  OrdersProvider({required this.datasource});

  SubstractedOrders get orders {
    final processing = <Order>[];
    final history = <Order>[];
    datasource.orders.reversed.forEach(
      (element) => element.status == OrderStatus.issued
          ? history.add(element)
          : processing.add(element),
    );
    return SubstractedOrders(processing: processing, history: history);
  }

  void addOrder(Order order) {
    datasource.addOrder(order);
    notifyListeners();
  }

  void editOrder(Order order) {
    datasource.updateOrder(order);
    notifyListeners();
  }

  void deleteOrder(Order order) {
    datasource.deleteOrder(order.id!);
    notifyListeners();
  }
}
