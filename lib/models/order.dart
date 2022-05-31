import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Order {
  /// Номер заказа
  @HiveField(0)
  final int orderNumber;

  /// Статус заказа
  @HiveField(1)
  String status;

  /// Имя клиента
  @HiveField(2)
  String clientName;

  /// Номер телефона клиента
  @HiveField(3)
  String clientPhoneNumber;

  /// Модель машины
  @HiveField(4)
  String carModel;

  /// Количество машин
  @HiveField(5)
  String numberCars;

  /// Название услуги
  @HiveField(6)
  String service;

  /// Стоимость работ
  @HiveField(7)
  int price;

  /// Работник, выполняющий работу
  @HiveField(8)
  int whoCompleting;

  /// Дата начала работ
  @HiveField(9)
  DateTime startDateTime;

  /// Дата окончания работ
  @HiveField(10)
  DateTime completeDateTime;

  Order({
    required this.orderNumber,
    required this.status,
    required this.carModel,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.completeDateTime,
    required this.numberCars,
    required this.price,
    required this.service,
    required this.startDateTime,
    required this.whoCompleting,
  });
}
