import 'package:data/users/entities/small_user_api_dto.dart';

abstract class UserApiDataSource {
  Future<List<SmallUserApiDto>> getUsers();
}
class UserApiDataSourceImpl implements UserApiDataSource {
  @override
  Future<List<SmallUserApiDto>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}