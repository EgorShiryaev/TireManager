import 'package:hive/hive.dart';
part 'service.g.dart';

@HiveType(typeId: 2)
class Service {
  /// Название услуги
  @HiveField(0)
  String title;

  /// Стоимость услуги (в копейках)
  @HiveField(1)
  int price;

  Service({required this.title, required this.price});
}
