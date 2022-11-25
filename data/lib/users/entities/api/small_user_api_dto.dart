import 'package:json_annotation/json_annotation.dart';

part 'small_user_api_dto.g.dart';

@JsonSerializable()
class SmallUserApiDto {
  final String id;
  final String firstName;
  final String lastName;
  final String? picture;

  SmallUserApiDto(this.id, this.firstName, this.lastName, this.picture);

  factory SmallUserApiDto.fromJson(Map<String, dynamic> json) => _$SmallUserApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmallUserApiDtoToJson(this);
}
