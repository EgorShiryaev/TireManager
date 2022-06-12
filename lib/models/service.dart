import 'package:hive/hive.dart';
import 'package:tire_manager/models/dropdown_value.dart';
part 'service.g.dart';

@HiveType(typeId: 1)
class Service extends DropdownValue {
  /// id услуги
  @HiveField(0)
  int? id;

  /// Название услуги
  @HiveField(1)
  String title;

  /// Стоимость услуги (в копейках)
  @HiveField(2)
  int price;

  Service({this.id, required this.title, required this.price});

  @override
  int? get dropdownId => id;

  @override
  String get dropdownTitle => title;
}
