import 'package:hive/hive.dart';

import 'dropdown_value.dart';
part 'employee.g.dart';

@HiveType(typeId: 2)
class Employee extends DropdownValue {
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

  Employee({
    this.id,
    required this.name,
    required this.surname,
    required this.fatherName,
  });

  String get initials => '${surname} ${name[0]}. ${fatherName[0]}.';

  @override
  int? get dropdownId => id;

  @override
  String get dropdownTitle => initials;
}
