import 'package:json_annotation/json_annotation.dart';

part 'small_user.g.dart';

@JsonSerializable()
class SmallUser {
  final String id;
  final String firstName;
  final String lastName;
  final String? picture;

  SmallUser(this.id, this.firstName, this.lastName, this.picture);

  /*factory SmallUser.fromJson(Map<String, dynamic> json) => _$SmallUserFromJson(json);

  Map<String, dynamic> toJson() => _$SmallUserToJson(this);*/
}
