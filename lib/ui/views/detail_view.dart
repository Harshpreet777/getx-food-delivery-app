import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/models/dish_detail_model.dart';
import 'package:getx_task/ui/widgets/common_elevated_button.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  DetailView({super.key,});
  DetailModel details = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteF6F6F9,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteF6F6F9,
        elevation: 0,
        leadingWidth: 50,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.black,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.favorite_outline,
                  color: ColorConstants.black,
                )),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                elevation: 20,
                shadowColor: ColorConstants.black,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(200)),
                  child: Image.asset(
                    details.images,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DotsIndicator(
                dotsCount: 4,
                decorator: DotsDecorator(
                    activeColor: ColorConstants.oragneFA4A0C,
                    color: ColorConstants.grey9A9A9D),
              ),
            ),
            TextWidget(
              text: details.name,
              textAlign: TextAlign.center,
              alignmentGeometry: Alignment.center,
              size: 28,
              fontWeight: FontWeight.w600,
              color: ColorConstants.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextWidget(
                textAlign: TextAlign.center,
                text: details.price,
                alignmentGeometry: Alignment.center,
                color: ColorConstants.oragneFA4A0C,
                fontWeight: FontWeight.w700,
                size: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.deliveryTitle,
                alignmentGeometry: Alignment.centerLeft,
                color: ColorConstants.black,
                fontWeight: FontWeight.w600,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.deliveryInfo,
                alignmentGeometry: Alignment.centerLeft,
                size: 16,
                color: ColorConstants.grey9A9A9D,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.returnTitle,
                alignmentGeometry: Alignment.centerLeft,
                color: ColorConstants.black,
                fontWeight: FontWeight.w600,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.returnInfo,
                alignmentGeometry: Alignment.centerLeft,
                size: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstants.grey9A9A9D,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: ElevatedBtnWidget(
                  color: ColorConstants.oragneFA4A0C,
                  name: StringConstants.addToCart,
                  textColor: ColorConstants.white),
            )
          ],
        ),
      ),
    );
  }

  Scaffold detailScaffold(String img, String dishname, String price) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteF6F6F9,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteF6F6F9,
        elevation: 0,
        leadingWidth: 50,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.black,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.favorite_outline,
                  color: ColorConstants.black,
                )),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                elevation: 20,
                shadowColor: ColorConstants.black,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(200)),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DotsIndicator(
                dotsCount: 4,
                decorator: DotsDecorator(
                    activeColor: ColorConstants.oragneFA4A0C,
                    color: ColorConstants.grey9A9A9D),
              ),
            ),
            TextWidget(
              text: dishname,
              textAlign: TextAlign.center,
              alignmentGeometry: Alignment.center,
              size: 28,
              fontWeight: FontWeight.w600,
              color: ColorConstants.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextWidget(
                textAlign: TextAlign.center,
                text: price,
                alignmentGeometry: Alignment.center,
                color: ColorConstants.oragneFA4A0C,
                fontWeight: FontWeight.w700,
                size: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.deliveryTitle,
                alignmentGeometry: Alignment.centerLeft,
                color: ColorConstants.black,
                fontWeight: FontWeight.w600,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.deliveryInfo,
                alignmentGeometry: Alignment.centerLeft,
                size: 16,
                color: ColorConstants.grey9A9A9D,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.returnTitle,
                alignmentGeometry: Alignment.centerLeft,
                color: ColorConstants.black,
                fontWeight: FontWeight.w600,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextWidget(
                textAlign: TextAlign.left,
                text: StringConstants.returnInfo,
                alignmentGeometry: Alignment.centerLeft,
                size: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstants.grey9A9A9D,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: ElevatedBtnWidget(
                  color: ColorConstants.oragneFA4A0C,
                  name: StringConstants.addToCart,
                  textColor: ColorConstants.white),
            )
          ],
        ),
      ),
    );
  }
}
