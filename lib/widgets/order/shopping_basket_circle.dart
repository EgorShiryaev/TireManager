import 'package:flutter/material.dart';

import '../../assets.dart';

class ShoppingBasketCircle extends StatelessWidget {
  const ShoppingBasketCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        'assets/' + Assets.shoppingBasket,
        color: Colors.white,
      ),
    );
  }
}
