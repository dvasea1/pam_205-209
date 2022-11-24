import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class GetUsersUseCase {

  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<SmallUser>> call() async  {
    var users = await repository.getUsers();
    //Aici prelucram users
    return users;
  }
}