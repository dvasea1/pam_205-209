import 'package:data/local_database/local_database.dart';
import 'package:drift/drift.dart';

abstract class UserDbDataSource {
  Future<void> insertUsers(List<UserTableData> users);

  Future<List<UserTableData>> getUsers();

  Stream<List<UserTableData>> getUsersStream();
}

class UserDbDataSourceImpl implements UserDbDataSource {
  LocalDataBase db;

  UserDbDataSourceImpl(this.db);

  @override
  Future<List<UserTableData>> getUsers() async {
    var query = db.select(db.userTable);
    return query.get();
  }

  @override
  Stream<List<UserTableData>> getUsersStream() {
    var query = db.select(db.userTable);
    return query.watch();
  }

  @override
  Future<void> insertUsers(List<UserTableData> users) async {
    await db.batch((batch) {
      batch.insertAll(db.userTable, users, mode: InsertMode.insertOrReplace);
    });
  }
}
