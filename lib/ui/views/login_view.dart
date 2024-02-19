import 'package:flutter/material.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/utils/validation_util.dart';
import 'package:getx_task/core/viewmodels/login_view_model.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginViewModel? model;
  @override
  Widget build(BuildContext context) {
    return loginForm(context);
  }

  Form loginForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: model?.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
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
              onChanged: (value) => model?.controller.lgnEmailController(value),
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
                return Validations.isPassValid(value.toString());
              },
              onChanged: (value) => model?.controller.lgnPassController(value),
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
              textAlign: TextAlign.left,
              text: StringConstants.forgotpasscode,
              alignmentGeometry: Alignment.topLeft,
              fontWeight: FontWeight.w600,
              size: 17,
              color: ColorConstants.oragneFA4A0C,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedBtnWidget(
                onpress: () {
                  model?.onLoginButtonClicked(context);
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
