import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/providers/auth_provider.dart';
import 'package:tire_manager/screens/employee/employees_screen.dart';
import 'package:tire_manager/screens/order/orders_screen.dart';
import 'package:tire_manager/screens/service/services_screen.dart';
import '../../widgets/index.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  void _signOut() =>
      Provider.of<AuthProvider>(context, listen: false).signOut();

  void _goToOrdersScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrdersScreen()),
    );
  }

  void _goToServicesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServicesScreen()),
    );
  }

  void _goToEmployeesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmployeesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 40,
            onPressed: _signOut,
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainMenuChapterButton(
              iconFileName: Assets.ordersPng,
              title: 'Заказы',
              onTap: _goToOrdersScreen,
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterButton(
              iconFileName: Assets.servicesPng,
              title: 'Услуги',
              onTap: _goToServicesScreen,
              needBlackFill: true,
            ),
            const Divider(height: 1),
            MainMenuChapterButton(
              iconFileName: Assets.staffPng,
              title: 'Персонал',
              onTap: _goToEmployeesScreen,
            ),
          ],
        ),
      ),
    );
  }
}
