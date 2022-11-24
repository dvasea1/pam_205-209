
import 'package:data/users/entities/small_user_api_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:domain/users/models/small_user.dart';

part 'users_response_api_dto.g.dart';

@JsonSerializable()
class UsersResponseApiDto {
  @JsonKey(name: 'data')
  final List<SmallUserApiDto> users;

  UsersResponseApiDto(this.users);

  factory UsersResponseApiDto.fromJson(Map<String, dynamic> json) => _$UsersResponseApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseApiDtoToJson(this);
}
