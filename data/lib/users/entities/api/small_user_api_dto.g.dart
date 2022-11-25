// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_user_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmallUserApiDto _$SmallUserApiDtoFromJson(Map<String, dynamic> json) =>
    SmallUserApiDto(
      json['id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['picture'] as String?,
    );

Map<String, dynamic> _$SmallUserApiDtoToJson(SmallUserApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
