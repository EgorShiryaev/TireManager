import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  /// Имя пользователя
  @HiveField(0)
  final String userName;

  /// Захешированный пароль
  @HiveField(1)
  final String password;

  User({
    required this.userName,
    required this.password,
  });
}
