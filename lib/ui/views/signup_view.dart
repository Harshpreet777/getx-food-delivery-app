import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/utils/validation_util.dart';
import 'package:getx_task/ui/views/login_signup_view.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passController1 = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey1,
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
              controller: emailController1,
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
                return Validations.isPassValid(value ?? '');
              },
              controller: passController1,
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
                  if (formKey1.currentState!.validate()) {
                    String email = emailController1.text;
                    String pass = passController1.text;
                    userData.write('email', email);
                    userData.write('pass', pass);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginSignUpView(),
                        ));
                    // Get.toNamed(Routes.loginSignUpRoute);
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
