import 'package:flutter/material.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/image_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/ui/views/signup_view.dart';
import 'package:getx_task/ui/views/login_view.dart';

class LoginSignUpView extends StatelessWidget {
  const LoginSignUpView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: scaffold(),
    );
  }

  Scaffold scaffold() {
    return Scaffold(
        backgroundColor: ColorConstants.greyEFEEEE,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.greyEFEEEE),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: ColorConstants.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            ImageConstant.bigLogo,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TabBar(
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 3,
                          dividerHeight: 0,
                          automaticIndicatorColorAdjustment: true,
                          indicatorColor: ColorConstants.oragneFA4A0C,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40),
                                child: Text(
                                  StringConstants.login,
                                  style: TextStyle(
                                      color: ColorConstants.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40),
                                child: Text(
                                  StringConstants.signup,
                                  style: TextStyle(
                                      color: ColorConstants.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:800,
                  child:  TabBarView(
                      children: [LoginScreen(), SignUpScreen()]))
            ],
          ),
        ));
  }
}
