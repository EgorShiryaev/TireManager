import 'package:hive/hive.dart';
part 'employee.g.dart';

@HiveType(typeId: 3)
class Employee {
  /// Имя сотрудника
  @HiveField(0)
  String name;

  /// Фамилия сотрудника
  @HiveField(1)
  String surname;

  /// Отчество сотрудника
  @HiveField(2)
  String fatherName;

  Employee({
    required this.name,
    required this.surname,
    required this.fatherName,
  });
}
