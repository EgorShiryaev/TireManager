import 'package:hive_flutter/hive_flutter.dart';
import 'package:tire_manager/models/user.dart';

class LocalDatasource {
  static const appState = 'AppState';
  static const usersBox = 'Users';
  static const orders = 'Orders';
  static const services = 'Services';
  static const personals = 'Personals';

  Future<void> init() async {
    await Hive.openLazyBox(appState);
    await Hive.openLazyBox<User>(usersBox);
    await Hive.openLazyBox(orders);
    await Hive.openLazyBox(services);
    await Hive.openLazyBox(personals);
  }
}
