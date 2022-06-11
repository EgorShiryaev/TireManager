import 'order.dart';

class SubstractedOrders {
  final List<Order> processing;
  final List<Order> history;

  SubstractedOrders({
    required this.processing,
    required this.history,
  });
}