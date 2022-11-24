import 'package:data/users/entities/small_user_api_dto.dart';
import 'package:domain/users/models/small_user.dart';

class SmallUserMapper {
  SmallUser mapApiDtoToModel(SmallUserApiDto input) {
    return SmallUser(input.id, input.firstName, input.lastName, input.picture);
  }
}
