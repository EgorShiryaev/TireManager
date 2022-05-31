import 'package:flutter/material.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/presentation/screens/screens.dart';
import 'package:tire_manager/presentation/widgets/widgets.dart';


class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app_outlined,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainMenuChapterButton(
              iconFileName: Assets.ordersPng,
              title: 'Заказы',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterButton(
              iconFileName: Assets.servicesPng,
              title: 'Услуги',
              onTap: () {},
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterButton(
              iconFileName: Assets.staffPng,
              title: 'Персонал',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
