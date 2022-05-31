import 'package:tire_manager/data/SQL/table.dart';

class UserIsAuthTable extends Table {
  @override
  String get _title => 'UserIsAuth';

  @override
  List<String> get _columns => ['userIsAuth'];
}
