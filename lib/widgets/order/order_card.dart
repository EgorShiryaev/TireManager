import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/screens/order/edit_order_screen.dart';
import 'package:tire_manager/widgets/filled_container.dart';
import '../../models/order.dart';
import '../../utils/create_route.dart';
import '../dismissible_card.dart';

class OrderCard extends StatefulWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  void onDismissed() {
    Provider.of<OrdersProvider>(context, listen: false)
        .deleteOrder(widget.order);
  }

  void onTapCard() {
    Navigator.push(
      context,
      createRoute(context, EditOrderScreen(order: widget.order)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleCard(
      onDismissed: onDismissed,
      onTapCard: onTapCard,
      id: widget.order.orderNumber!,
      cardContent: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/' + Assets.shoppingBasket,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Заказ #${widget.order.orderNumber}'),
                      Text('${widget.order.issueDateTime}'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(widget.order.status),
                  ),
                ],
              ),
              Text('${(widget.order.service.price / 100).toStringAsFixed(2)} ₽')
            ],
          ),
          const SizedBox(height: 10),
          FilledContainer(data: widget.order.clientPhone),
          const SizedBox(height: 10),
          FilledContainer(data: widget.order.carModel),
        ],
      ),
    );
  }
}
