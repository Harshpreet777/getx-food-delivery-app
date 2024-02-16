import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user_list_response_model.g.dart';

List<UserListResponseModel> userListResponseModelFromJson(String str) =>
    List<UserListResponseModel>.from(
        json.decode(str).map((x) => UserListResponseModel.fromJson(x)));

String userListResponseModelToJson(List<UserListResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class UserListResponseModel {
  int id;
  String name;
  String email;
  String gender;
  String status;

  UserListResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory UserListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserListResponseModelToJson(this);
}
