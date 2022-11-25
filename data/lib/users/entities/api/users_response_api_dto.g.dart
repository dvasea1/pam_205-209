// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponseApiDto _$UsersResponseApiDtoFromJson(Map<String, dynamic> json) =>
    UsersResponseApiDto(
      (json['data'] as List<dynamic>)
          .map((e) => SmallUserApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersResponseApiDtoToJson(
        UsersResponseApiDto instance) =>
    <String, dynamic>{
      'data': instance.users,
    };
