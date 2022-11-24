import 'package:data/users/datasources/user_api_data_source.dart';
import 'package:data/users/mappers/small_user_mapper.dart';
import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiDataSource userApiDataSource;

  UserRepositoryImpl(this.userApiDataSource);

  @override
  Future<List<SmallUser>> getUsers() async {
    var users = await userApiDataSource.getUsers();
    return users.map((e) => SmallUserMapper().mapApiDtoToModel(e)).toList();
  }
}
