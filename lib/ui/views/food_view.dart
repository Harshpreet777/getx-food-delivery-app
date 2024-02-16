import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/models/dish_detail_model.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/ui/widgets/common_text.dart';

// ignore: must_be_immutable
class FoodView extends StatelessWidget {
  FoodView({super.key});
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: dishListView(),
    );
  }

  ListView dishListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        DetailModel data = DetailModel.dishDetail[index];

        return SizedBox(
          height: 400,
          width: 280,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 90,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.detailsRoute,
                        arguments:data);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            data.images,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: TextWidget(
                          textAlign: TextAlign.center,
                          text: data.name,
                          alignmentGeometry: Alignment.center,
                          size: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: data.price,
                        alignmentGeometry: Alignment.center,
                        color: ColorConstants.oragneFA4A0C,
                        size: 20,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
