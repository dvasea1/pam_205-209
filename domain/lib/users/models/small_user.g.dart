// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmallUser _$SmallUserFromJson(Map<String, dynamic> json) => SmallUser(
      json['id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['picture'] as String?,
    );

Map<String, dynamic> _$SmallUserToJson(SmallUser instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
