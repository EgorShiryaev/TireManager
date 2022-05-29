import 'package:flutter/material.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/screens/orders_screen.dart';
import 'package:tire_manager/widgets/main_menu_chapter_icon.dart';

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
            MainMenuChapterIcon(
              iconFileName: Assets.ordersPng,
              title: 'Заказы',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterIcon(
              iconFileName: Assets.servicesPng,
              title: 'Услуги',
              onTap: () {},
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterIcon(
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
