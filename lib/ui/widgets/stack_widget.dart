import 'package:flutter/material.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class StackWidget extends StatelessWidget {
  StackWidget({super.key, required this.image, required this.name});
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 50,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                  color: ColorConstants.whiteFFFFFF,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: name,
                  alignmentGeometry: Alignment.center,
                  size: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextWidget(
                textAlign: TextAlign.center,
                text: StringConstants.price,
                alignmentGeometry: Alignment.center,
                color: ColorConstants.oragneFA4A0C,
                size: 20,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
        ),
      ],
    );
  }
}
