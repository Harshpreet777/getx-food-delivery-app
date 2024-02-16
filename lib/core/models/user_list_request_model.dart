
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user_list_request_model.g.dart';
UserListRequestModel userListRequestModelFromJson(String str) => UserListRequestModel.fromJson(json.decode(str));

String userListRequestModelToJson(UserListRequestModel data) => json.encode(data.toJson());
@JsonSerializable()
class UserListRequestModel {
    String email;
    String name;
    String gender;
    String status;

    UserListRequestModel({
        required this.email,
        required this.name,
        required this.gender,
        required this.status,
    });

    factory UserListRequestModel.fromJson(Map<String, dynamic> json) => _$UserListRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$UserListRequestModelToJson(this);
}