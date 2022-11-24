import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:test_2/local_database/user_table.dart';

import 'comments.dart';

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
  CommentTable,
])
class LocalDataBase extends _$LocalDataBase {
  LocalDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(onUpgrade: (Migrator m, int from, int to) async {
        print('LocalDataBase migrated: $from to $to');
        if (from == 3 && to == 4) {
          await m.createTable(commentTable);
        }
      });

  void insertUsers(List<UserTableData> users) async {
    await batch((batch) {
      batch.insertAll(userTable, users, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<UserTableData>> getUsers() async {
    var query = select(userTable);
    return query.get();
  }

  Stream<List<UserTableData>> getUsersStream() {
    var query = select(userTable);
    return query.watch();
  }

  Future<List<CommentTableData>> getComments() async {
    var query = select(commentTable);
    return query.get();
  }
}
