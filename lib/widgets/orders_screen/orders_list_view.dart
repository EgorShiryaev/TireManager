import 'package:flutter/material.dart';

import 'order_widget.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => const OrderWidget(),
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: 10,
    );
  }
}
