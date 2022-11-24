import 'package:domain/users/models/small_user.dart';

abstract class UserRepository {
  Future<List<SmallUser>> getUsers();
}
