import 'package:data/local_database/local_database.dart';
import 'package:data/users/entities/api/small_user_api_dto.dart';
import 'package:domain/users/models/small_user.dart';

class SmallUserMapper {
  SmallUser mapApiDtoToModel(SmallUserApiDto input) {
    return SmallUser(input.id, input.firstName, input.lastName, input.picture);
  }

  SmallUser mapDbToModel(UserTableData input) {
    return SmallUser(input.id, input.firstName, input.lastName, input.picture);
  }

  UserTableData mapModelToDb(SmallUser input) {
    return UserTableData(id: input.id, firstName: input.firstName, lastName: input.lastName, picture: input.picture);
  }
}
