import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/utils/validation_util.dart';
import 'package:getx_task/ui/views/home_view.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 10),
            child: TextWidget(
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
              controller: emailController,
              style: TextStyle(
                  fontSize: 17,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w600),
              decoration:
                  InputDecoration(hintText: StringConstants.emailaddress),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: TextWidget(
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
                return Validations.isPassValid(value.toString());
              },
              controller: passController,
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
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: TextWidget(
              text: StringConstants.forgotpasscode,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 17,
              color: ColorConstants.oragneFA4A0C,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedBtnWidget(
                onpress: () {
                  if (formKey.currentState!.validate()) {
                    String email = userData.read('email');
                    String pass = userData.read('pass');
                    if (emailController.text == email &&
                        passController.text == pass) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ));
                      userData.remove('email');
                      userData.remove('pass');
                      // Get.toNamed(Routes.homeRoute);
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
                },
                color: ColorConstants.oragneFA4A0C,
                name: StringConstants.login,
                textColor: ColorConstants.white),
          )
        ],
      ),
    );
  }
}
