import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/screens/order/edit_order_screen.dart';
import 'package:tire_manager/widgets/filled_container.dart';
import '../../models/order.dart';
import '../../utils/create_route.dart';
import '../dismissible_card.dart';
import 'shopping_basket_circle.dart';

class OrderCard extends StatefulWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

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
    final issueDateTime =
        '${DateFormat.Hm('ru').format(widget.order.issueDateTime)} ${DateFormat.Md('ru').format(widget.order.issueDateTime)}';
    return DismissibleCard(
      onDismissed: onDismissed,
      onTapCard: onTapCard,
      id: widget.order.id!,
      cardContent: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ShoppingBasketCircle(),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Заказ #${widget.order.id}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          issueDateTime,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.order.status,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '${(widget.order.service.price / 100).toStringAsFixed(2)} ₽',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                    )
                  ],
                )
              ],
            ),
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
