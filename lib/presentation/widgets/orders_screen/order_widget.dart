import 'package:flutter/material.dart';
import 'package:tire_manager/app_theme.dart';
import 'package:tire_manager/assets.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

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
                    child: Image.asset(
                      'assets/' + Assets.shopBasket,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: const [
                      Text('Заказ #${345}'),
                      Text('14:30 21.02'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Готов'),
                  ),
                ],
              ),
              const Text('1356.00 ₽')
            ],
          ),
          const SizedBox(height: 10),
          _filledContainer('+7 (912) 375 44 - 45'),
          const SizedBox(height: 10),
          _filledContainer('BMW x333xx43'),
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
