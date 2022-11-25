import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../users/entities/db/user_table.dart';

part 'local_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'local_database.sqlite'));

    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [
  UserTable,
])
class LocalDataBase extends _$LocalDataBase {
  LocalDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(onUpgrade: (Migrator m, int from, int to) async {
        print('LocalDataBase migrated: $from to $to');
      });
}
