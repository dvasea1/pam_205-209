import 'package:json_annotation/json_annotation.dart';
import 'package:test_2/presentation/home/models/user.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  User user;

  Response(this.user);

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
