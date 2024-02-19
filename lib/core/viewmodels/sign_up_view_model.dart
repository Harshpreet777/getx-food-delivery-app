import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/controller/controller.dart';
import 'package:getx_task/core/models/user_list_request_model.dart';
import 'package:getx_task/core/persistence/get_storage.dart';
import 'package:getx_task/core/repos/service.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/core/utils/toast_utils.dart';

class SignUpViewModel {
  ApiServices apiServices = Get.find();
  Controller controller = Get.put(Controller());
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  // ignore: prefer_typing_uninitialized_variables
  var code;

  Future postSignUp(
      BuildContext context, UserListRequestModel requestModel) async {
    final response = await apiServices.postData(requestModel);
    code = response.statusCode;
    try {
      if (response.statusCode == 201) {
        Get.snackbar(StringConstants.registered, StringConstants.registeredMsg);
        log(response.toString());
        if (context.mounted) {
          Navigator.of(context).pushNamed(Routes.loginSignUpRoute);
        }
      } else if (response.statusCode == 422) {
        Get.snackbar('Already Registered', 'User Already Registered');
        log(StringConstants.already);
      } else {
        FlutterToastUtil.showToast(StringConstants.somethingWentWrong);
      }
    } catch (e) {
      log('Error is $e');
    }
  }

  onClickSignUp(BuildContext context) {
    if (formKey1.currentState?.validate() ?? false) {
      var email = controller.email.value;
      var name = controller.name.value;
      var pass = controller.pass.value;
      UserStorage.setData(UserStorage.emailKey, email);
      UserStorage.setData(UserStorage.passKey, pass);
       postSignUp(
              context,
              UserListRequestModel(
                  email: email,
                  name: name,
                  gender: controller.selectedGender.value,
                  status: StringConstants.status));
      if (context.mounted) {}
      Get.toNamed(Routes.loginSignUpRoute);
    } else {
      Get.snackbar(
          StringConstants.notRegistered, StringConstants.notRegisteredMsg);
    }
  }
}
