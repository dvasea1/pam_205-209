import 'package:domain/users/common/use_case.dart';
import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class GetUsersFromApiUseCase implements UseCase<Future<List<SmallUser>>, GetUsersFromApiParams> {
  final UserRepository repository;

  GetUsersFromApiUseCase(this.repository);

  @override
  Future<List<SmallUser>> call(GetUsersFromApiParams params) {
    return repository.getUsersApi(params.page, params.limit);
  }
}

class GetUsersFromApiParams {
  int page;
  int limit;

  GetUsersFromApiParams(this.page, this.limit);
}
