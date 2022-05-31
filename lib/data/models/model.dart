abstract class Model {
  final int id;
  Model({required this.id});

  List<String> get valuesForSql;
}
