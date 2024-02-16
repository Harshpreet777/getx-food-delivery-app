import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/image_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return welcome(context);
  }

  Scaffold welcome(BuildContext context) {
    return welcomeScaffold(context);
  }

  Scaffold welcomeScaffold(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: ColorConstants.oragneFA4A0C),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 30),
                  child: CircleAvatar(
                    backgroundColor: ColorConstants.white,
                    minRadius: 35,
                    maxRadius: 35,
                    child: Image.asset(ImageConstant.logo),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextWidget(
                  textAlign: TextAlign.left,
                  text: StringConstants.welcomeTitle,
                  alignmentGeometry: Alignment.topLeft,
                  size: 60,
                  fontWeight: FontWeight.w800,
                  color: ColorConstants.white,
                ),
              ),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(ImageConstant.maleToy)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(ImageConstant.femaleToy)),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 700,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: const [0.2, 5],
                              end: Alignment.center,
                              begin: Alignment.bottomCenter,
                              colors: [
                                ColorConstants.oragneFA4A0C,
                                Colors.transparent
                              ])),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedBtnWidget(
                          onpress: () {
                            Get.toNamed(Routes.loginSignUpRoute);
                          },
                          color: ColorConstants.white,
                          name: StringConstants.welcomeBtnText,
                          textColor: ColorConstants.oragneFA4A0C),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
