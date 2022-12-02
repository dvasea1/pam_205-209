import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class GetUsersStreamUseCase {

  final UserRepository repository;

  GetUsersStreamUseCase(this.repository);

  Stream<List<SmallUser>> call(int page, int limit) async * {
     repository.getUsersApi(page, limit).then((value) {
       repository.insertUsersDb(value);
     });
    yield* repository.getUsersStream();
  }
}