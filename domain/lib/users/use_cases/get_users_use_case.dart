import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class GetUsersUseCase {

  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Stream<List<SmallUser>> call() async * {
     repository.getUsersApi().then((value) {
       repository.insertUsersDb(value);
     });
    yield* repository.getUsersStream();
  }
}