import 'package:domain/users/models/small_user.dart';

abstract class UserRepository {
  Future<List<SmallUser>> getUsersApi(int page, int limit);

  Future<List<SmallUser>> getUsersFromDb();

  Stream<List<SmallUser>> getUsersStream();

  Future<void> insertUsersDb(List<SmallUser> users);
}
