import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getx_task/core/constants/color_constants.dart';
import 'package:getx_task/core/constants/image_constants.dart';
import 'package:getx_task/core/constants/string_constants.dart';
import 'package:getx_task/ui/widgets/common_text.dart';
import 'package:getx_task/ui/widgets/stack_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteF6F6F9,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              TextWidget(
                text: StringConstants.resultTitle,
                alignmentGeometry: Alignment.center,
                fontWeight: FontWeight.w700,
                color: ColorConstants.black,
                size: 28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: MasonryGridView.count(
                    physics: const PageScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    itemCount: StringConstants.stringList.length,
                    semanticChildCount: 2,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 330,
                          child: Padding(
                            padding: index % 2 == 0
                                ? const EdgeInsets.all(0)
                                : const EdgeInsets.only(top: 50),
                            child: StackWidget(
                              name: StringConstants.stringList[index],
                              image: ImageConstant.imgList[index],
                            ),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
