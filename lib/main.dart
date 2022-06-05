import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/app_theme.dart';
import 'package:tire_manager/datasources/local_datasource.dart';
import 'package:tire_manager/providers/auth_provider.dart';
import 'package:tire_manager/providers/employees_provider.dart';
import 'package:tire_manager/providers/orders_provider.dart';
import 'package:tire_manager/providers/services_provider.dart';
import 'package:tire_manager/screens/main_menu_screen.dart';

import 'screens/auth_screen.dart';

Future<void> main() async {
  await initializeDateFormatting();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final datasource = LocalDatasource();
  await datasource.init();
  runApp(TireManagerApp(datasource: datasource));
}

class TireManagerApp extends StatelessWidget {
  final LocalDatasource datasource;
  const TireManagerApp({Key? key, required this.datasource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(datasource: datasource)),
        ChangeNotifierProvider(
            create: (_) => EmployeesProvider(datasource: datasource)),
        ChangeNotifierProvider(
            create: (_) => OrdersProvider(datasource: datasource)),
        ChangeNotifierProvider(
            create: (_) => ServicesProvider(datasource: datasource)),
      ],
      child: MaterialApp(
        title: 'Tire Manager',
        theme: AppTheme().light,
        home: Consumer<AuthProvider>(
          builder: (context, value, _) =>
              value.userIsAuth ? const MainMenuScreen() : const AuthScreen(),
        ),
      ),
    );
  }
}
