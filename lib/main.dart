import 'package:flutter/material.dart';
import 'package:tire_manager/app_theme.dart';

import 'presentation/screens/screens.dart';

void main() {
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
