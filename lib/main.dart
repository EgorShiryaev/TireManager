import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tire_manager/app_theme.dart';
import 'screens/screens.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const TireManagerApp());
}

class TireManagerApp extends StatelessWidget {
  const TireManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tire Manager',
      theme: AppTheme().light,
      home: const AuthScreen(),
    );
  }
}
