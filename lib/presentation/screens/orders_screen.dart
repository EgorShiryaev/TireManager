import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Авторизация'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'В процессе'),
              Tab(text: 'История'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrdersListView(),
            OrdersListView(),
          ],
        ),
      ),
    );
  }
}
