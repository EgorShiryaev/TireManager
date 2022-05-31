
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String password;

  User({
    required this.userName,
    required this.password,
  });
}
