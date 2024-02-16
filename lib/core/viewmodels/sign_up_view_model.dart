import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/enums/viewstate.dart';
import 'package:getx_task/core/models/user_list_request_model.dart';
import 'package:getx_task/core/repos/service.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/core/utils/toast_utils.dart';

class SignUpViewModel {
  ApiServices apiServices = ApiServices();
  // ignore: prefer_typing_uninitialized_variables
  var state;
  Future postSignUp(
      BuildContext context, UserListRequestModel requestModel) async {
    final response = await apiServices.postData(requestModel);
    state = ViewState.busy;
    try {
      state = ViewState.idle;
      if (response.statusCode == 201) {
        log(response.toString());
        if (context.mounted) {
          Navigator.of(context).pushNamed(Routes.loginSignUpRoute);
        }
      } else if (response.statusCode == 422) {
        log(StringConstants.already);
        state = ViewState.idle;
      } else {
        FlutterToastUtil.showToast(StringConstants.somethingWentWrong);
      }
    } catch (e) {
      log('Error is $e');
      state = ViewState.idle;
    }
    state = ViewState.idle;
  }
}
