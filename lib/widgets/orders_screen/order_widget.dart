import 'package:flutter/material.dart';
import 'package:tire_manager/app_theme.dart';
import 'package:tire_manager/assets.dart';

import '../../models/order.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
                      Text('Заказ #${order.orderNumber}'),
                      Text('${order.issueDateTime}'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(order.status),
                  ),
                ],
              ),
              Text('${(order.service.price / 100).toStringAsFixed(2)} ₽')
            ],
          ),
          const SizedBox(height: 10),
          _filledContainer(order.clientPhone),
          const SizedBox(height: 10),
          _filledContainer(order.carModel),
        ],
      ),
    );
  }

  _filledContainer(String data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppTheme.textFieldFillColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(data),
    );
  }
}
