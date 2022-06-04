import 'package:hive_flutter/hive_flutter.dart';
import 'package:tire_manager/models/employee.dart';
import 'package:tire_manager/models/order.dart';
import 'package:tire_manager/models/service.dart';

class LocalDatasource {
  static const _appStateUrl = 'AppState';
  static const _ordersUrl = 'Orders';
  static const _servicesUrl = 'Services';
  static const _employeesUrl = 'Employees';

  Future<void> init() async {
    await Hive.openLazyBox(_appStateUrl);
    await Hive.openLazyBox<Order>(_ordersUrl);
    await Hive.openLazyBox<Service>(_servicesUrl);
    await Hive.openLazyBox<Employee>(_employeesUrl);
  }

  Box get _appStateBox => Hive.box(_appStateUrl);

  bool get userIsAuth => _appStateBox.get('userIsAuth', defaultValue: false);

  set userIsAuth(bool value) => _appStateBox.put('userIsAuth', value);

  Box<Order> get _ordersBox => Hive.box<Order>(_ordersUrl);

  List<Order> get orders {
    final values = _ordersBox.values.toList();
    final keys = _ordersBox.keys.toList();
    for (var i = 0; i < values.length; i++) {
      values[i].orderNumber = keys[i];
    }
    return values;
  }

  void addOrder(Order order) => _ordersBox.add(order);

  void updateOrder(Order order) => _ordersBox.put(order.orderNumber, order);

  void deleteOrder(int orderNumber) => _ordersBox.delete(orderNumber);

  Box<Service> get _servicesBox => Hive.box<Service>(_servicesUrl);

  List<Service> get services {
    final values = _servicesBox.values.toList();
    final keys = _servicesBox.keys.toList();
    for (var i = 0; i < values.length; i++) {
      values[i].id = keys[i];
    }
    return values;
  }

  void addService(Service service) => _servicesBox.add(service);

  void updateService(Service service) => _servicesBox.put(service.id, service);

  void deleteService(int id) => _servicesBox.delete(id);

  Box<Employee> get _employeesBox => Hive.box<Employee>(_employeesUrl);

  List<Employee> get employees {
    final values = _employeesBox.values.toList();
    final keys = _employeesBox.keys.toList();
    for (var i = 0; i < values.length; i++) {
      values[i].id = keys[i];
    }
    return values;
  }

  void addEmployee(Employee service) => _employeesBox.add(service);

  void updateEmployee(Employee service) =>
      _employeesBox.put(service.id, service);

  void deleteEmployee(int id) => _employeesBox.delete(id);
}
