import 'package:hive/hive.dart';
import 'package:tire_manager/models/service.dart';

import 'employee.dart';
part 'order.g.dart';

@HiveType(typeId: 0)
class Order {
  /// Номер заказа
  @HiveField(0)
  int? orderNumber;

  /// Статус заказа
  @HiveField(1)
  String status;

  /// Имя клиента
  @HiveField(2)
  String clientName;

  /// Номер телефона клиента
  @HiveField(3)
  String clientPhone;

  /// Модель машины
  @HiveField(4)
  String carModel;

  /// Услуга
  @HiveField(5)
  Service service;

  /// Работник
  @HiveField(6)
  Employee employee;

  /// Дата начала работ
  @HiveField(7)
  DateTime startDateTime;

  /// Дата окончания работ
  @HiveField(8)
  DateTime issueDateTime;

  Order({
    this.orderNumber,
    required this.status,
    required this.carModel,
    required this.clientName,
    required this.clientPhone,
    required this.issueDateTime,
    required this.service,
    required this.startDateTime,
    required this.employee,
  });
}
