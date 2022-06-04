import 'package:hive/hive.dart';
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

  /// Стоимость работ (в копейках)
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
    this.orderNumber,
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
