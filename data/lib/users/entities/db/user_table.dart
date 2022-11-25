import 'package:drift/drift.dart';

class UserTable extends Table {
  TextColumn get id => text()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get picture => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
