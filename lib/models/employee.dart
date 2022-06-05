import 'package:hive/hive.dart';
part 'employee.g.dart';

@HiveType(typeId: 2)
class Employee {
  /// id сотрудника
  @HiveField(0)
  int? id;

  /// Имя сотрудника
  @HiveField(1)
  String name;

  /// Фамилия сотрудника
  @HiveField(2)
  String surname;

  /// Отчество сотрудника
  @HiveField(3)
  String fatherName;

  String get initials => '${surname} ${name[0]}. ${fatherName[0]}.';

  Employee({
    required this.name,
    required this.surname,
    required this.fatherName,
  });
}
