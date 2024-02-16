import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/enums/viewstate.dart';
import 'package:getx_task/core/models/user_list_request_model.dart';
import 'package:getx_task/core/persistence/get_storage.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/core/utils/validation_util.dart';
import 'package:getx_task/core/controller/gender_controller.dart';
import 'package:getx_task/core/viewmodels/sign_up_view_model.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final userData = GetStorage();
  String gender = "male";
  String status = "active";
  Controller controller = Get.put(Controller());

  SignUpViewModel model = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return signUpForm(context);
  }

  Form signUpForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: TextWidget(
              textAlign: TextAlign.left,
              text: StringConstants.name,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 15,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              validator: (value) {
                return Validations.isNameValid(value.toString());
              },
              onChanged: (value) => controller.nameController(value),
              style: TextStyle(
                  fontSize: 17,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(hintText: StringConstants.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: TextWidget(
              textAlign: TextAlign.left,
              text: StringConstants.emailaddress,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 15,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              validator: (value) {
                return Validations.isEmailValid(value.toString());
              },
              onChanged: (value) => controller.emailController(value),
              style: TextStyle(
                  fontSize: 17,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w600),
              decoration:
                  InputDecoration(hintText: StringConstants.emailaddress),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: TextWidget(
              textAlign: TextAlign.left,
              text: StringConstants.password,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 15,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              validator: (value) {
                return Validations.isPassValid(value ?? '');
              },
              onChanged: (value) => controller.passController(value),
              obscureText: true,
              obscuringCharacter: '*',
              style: TextStyle(
                  fontSize: 17,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: StringConstants.password,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: TextWidget(
              textAlign: TextAlign.left,
              text: StringConstants.confrimPass,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 15,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              validator: (value) {
                if (controller.confirmpass.value != controller.pass.value) {
                  return StringConstants.passNotMatch;
                } else {
                  return Validations.isPassValid(value ?? '');
                }
              },
              onChanged: (value) => controller.confirmpassController(value),
              obscureText: true,
              obscuringCharacter: '*',
              style: TextStyle(
                  fontSize: 17,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: StringConstants.confrimPass,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.greyEFEEEE,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    StringConstants.gender,
                    style: TextStyle(
                        color: ColorConstants.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Flexible(
                      flex: 1,
                      child: RadioListTile(
                        title: Text(
                          StringConstants.male,
                          style: TextStyle(color: ColorConstants.black),
                        ),
                        value: "male",
                        groupValue: controller.selectedGender.value,
                        onChanged: (value) {
                          controller.onClickRadioButton(value);
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Flexible(
                      flex: 1,
                      child: RadioListTile(
                        title: Text(
                          StringConstants.female,
                          style: TextStyle(color: ColorConstants.black),
                        ),
                        value: "female",
                        groupValue: controller.selectedGender.value,
                        onChanged: (value) {
                          controller.onClickRadioButton(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextWidget(
            textAlign: TextAlign.left,
            text: StringConstants.forgotpasscode,
            alignmentGeometry: Alignment.topLeft,
            fontWeight: FontWeight.w600,
            size: 17,
            color: ColorConstants.oragneFA4A0C,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedBtnWidget(
                onpress: () {
                  if (formKey1.currentState?.validate() ?? false) {
                    var email = controller.email.value;
                    var name = controller.name.value;
                    var pass = controller.pass.value;
                    UserStorage.setData(UserStorage.emailKey, email);
                    UserStorage.setData(UserStorage.passKey, pass);

                    const snackBar =
                        SnackBar(content: Text('User Registered!'));
                    model.state == ViewState.busy
                        ? const Center(child: CircularProgressIndicator())
                        : model.postSignUp(
                            context,
                            UserListRequestModel(
                                email: email,
                                name: name,
                                gender: controller.selectedGender.value,
                                status: status));

                    if (context.mounted) {
                      Get.toNamed(Routes.loginSignUpRoute);
                    } else {
                      const snackBar =
                          SnackBar(content: Text('User Not Registered!'));
                      log(snackBar.toString());
                    }
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                color: ColorConstants.oragneFA4A0C,
                name: StringConstants.signup,
                textColor: ColorConstants.white),
          )
        ],
      ),
    );
  }
}
