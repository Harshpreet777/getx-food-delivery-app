import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/image_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/persistence/get_storage.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/ui/views/food_view.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: scaffold(),
    );
  }

  Scaffold scaffold() {
    return Scaffold(
        backgroundColor: ColorConstants.greyEFEEEE,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 200,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              IconButton(
                  onPressed: null,
                  icon: Image.asset(ImageConstant.hori3LineIcon)),
            ],
          ),
          actions: [
            SizedBox(
                width: 100,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ColorConstants.oragneFA4A0C)),
                    onPressed: () {
                      UserStorage.clearData();
                      Get.snackbar(
                          StringConstants.logout, StringConstants.logoutMsg);
                    },
                    child: Text(
                      StringConstants.logout,
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.w500),
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                      onPressed: null,
                      icon: Image.asset(ImageConstant.cartIcon))),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.homeTitle,
                alignmentGeometry: Alignment.topLeft,
                size: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onEditingComplete: () {
                  Get.toNamed(Routes.searchRoute);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: Container(
                      height: 30,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.searchRoute);
                        },
                        child: Image.asset(
                          ImageConstant.searchIcon,
                          fit: BoxFit.cover,
                          color: ColorConstants.black,
                        ),
                      ),
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    hintText: StringConstants.search,
                    fillColor: ColorConstants.grey,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none),
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorWeight: 3,
                  dividerHeight: 0,
                  unselectedLabelColor: ColorConstants.grey9A9A9D,
                  automaticIndicatorColorAdjustment: true,
                  indicatorColor: ColorConstants.oragneFA4A0C,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: ColorConstants.oragneFA4A0C,
                  tabs: [
                    Tab(
                      child: Text(
                        StringConstants.food,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      child: Text(
                        StringConstants.drink,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      child: Text(
                        StringConstants.snacks,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      child: Text(
                        StringConstants.sauce,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextWidget(
                textAlign: TextAlign.right,
                text: StringConstants.seeMore,
                alignmentGeometry: Alignment.centerRight,
                fontWeight: FontWeight.w400,
                size: 15,
                color: ColorConstants.oragneFA4A0C,
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: [FoodView(), FoodView(), FoodView(), FoodView()]),
            )
          ],
        ),
        extendBody: true,
        bottomNavigationBar: const SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: null, icon: Icon(Icons.home_outlined, size: 30)),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite_outline, size: 30)),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.access_time_filled_outlined,
                    size: 30,
                  )),
            ],
          ),
        ));
  }
}
