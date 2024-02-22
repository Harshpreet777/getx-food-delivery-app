import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/controller/controller.dart';
import 'package:getx_task/core/persistence/get_storage.dart';
import 'package:getx_task/core/routing/routes.dart';

class LoginViewModel extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userData = GetStorage();
  Controller controller = Get.put(Controller());
  final isLoading = false.obs;
  final isUserLogged = false.obs;

  onLoginButtonClicked(BuildContext context) async {
    isLoading.value = true;
    try {
      if (formKey.currentState?.validate() ?? false) {
        var email = UserStorage.getData(UserStorage.emailKey);
        var pass = UserStorage.getData(UserStorage.passKey);
        if (controller.lgnEmail.value == email &&
            controller.lgnPass.value == pass) {
          await Future.delayed(const Duration(seconds: 1), () {
            isUserLogged.value = true;
            UserStorage.setData(UserStorage.user, isUserLogged.value);
            Get.toNamed(Routes.homeRoute);
          });
        } else {
          showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Invalid Credentials'),
                    content: Text(StringConstants.noMatch),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ));
        }
      }
    } catch (e) {
      log('error is $e');
    } finally {
      isLoading.value = false;
    }
  }
}
