import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/models/user_list_request_model.dart';

class ApiServices extends GetConnect {
  Future getData() async {
    try {
      final response = await get(
        StringConstants.token,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer c9deacfd00d58aef0219b783eebff9cbac46821034ee07d465a2424b341c7725"
        },
      );

      return response;
    } catch (e) {
      log('Error sending request! $e');
    }
  }

  Future postData(UserListRequestModel requestModel) async {
    try {
      Response response =
          await post(StringConstants.token,
          requestModel.toJson(),decoder:(data) => userListRequestModelToJson(requestModel), headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer c9deacfd00d58aef0219b783eebff9cbac46821034ee07d465a2424b341c7725"
      });
      

      return response;
    } catch (e) {
      log("Failed to Load $e");
    }
  }
}
