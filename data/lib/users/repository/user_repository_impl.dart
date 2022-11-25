import 'package:data/users/datasources/api/user_api_data_source.dart';
import 'package:data/users/datasources/db/user_db_datasource.dart';
import 'package:data/users/mappers/small_user_mapper.dart';
import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiDataSource userApiDataSource;
  final UserDbDataSource userDbDataSource;

  UserRepositoryImpl(this.userApiDataSource, this.userDbDataSource);

  @override
  Future<List<SmallUser>> getUsersApi() async {
    var users = await userApiDataSource.getUsers();
    return users.map((e) => SmallUserMapper().mapApiDtoToModel(e)).toList();
  }

  @override
  Future<List<SmallUser>> getUsersFromDb() async {
    var users = await userDbDataSource.getUsers();
    return users.map((e) => SmallUserMapper().mapDbToModel(e)).toList();
  }

  @override
  Stream<List<SmallUser>> getUsersStream() {
    return userDbDataSource
        .getUsersStream()
        .map((listUsers) => listUsers.map((e) => SmallUserMapper().mapDbToModel(e)).toList());
  }

  @override
  Future<void> insertUsersDb(List<SmallUser> users) {
    return userDbDataSource.insertUsers(users.map((e) => SmallUserMapper().mapModelToDb(e)).toList());
  }
}
