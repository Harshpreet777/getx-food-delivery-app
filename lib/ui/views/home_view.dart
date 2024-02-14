import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/image_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/ui/views/food_view.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

class HomeView extends StatelessWidget {
   const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: ColorConstants.greyEFEEEE,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100,
            leading: IconButton(
                onPressed: null,
                icon: Image.asset(ImageConstant.hori3LineIcon)),
            actions: [
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
          )),
    );
  }
}
