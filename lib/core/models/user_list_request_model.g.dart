// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListRequestModel _$UserListRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserListRequestModel(
      email: json['email'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$UserListRequestModelToJson(
        UserListRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'status': instance.status,
    };
