import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/core/models/dish_detail_model.dart';
import 'package:getx_task/ui/widgets/common_text.dart';
import 'package:getx_task/ui/widgets/stack_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return searchScaffold(context);
  }

  Scaffold searchScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteF6F6F9,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              TextWidget(
                textAlign: TextAlign.center,
                text: StringConstants.resultTitle,
                alignmentGeometry: Alignment.center,
                fontWeight: FontWeight.w700,
                color: ColorConstants.black,
                size: 28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: dishGridView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  MasonryGridView dishGridView() {
    return MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        itemCount: DetailModel.dishDetail.length,
        semanticChildCount: 2,
        itemBuilder: (context, index) {
          DetailModel data = DetailModel.dishDetail[index];
          return SizedBox(
              height: 330,
              child: Padding(
                padding: index % 2 == 0
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(top: 50),
                child: StackWidget(
                  name: data.name,
                  image: data.images,
                ),
              ));
        });
  }
}
