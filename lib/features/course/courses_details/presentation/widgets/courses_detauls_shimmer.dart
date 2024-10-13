

import 'package:teaching/core/export/export.dart';

class CoursesDetailsShimmer extends StatelessWidget {
  const CoursesDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.vs,
        CustomShimmer.fromCircular(
          // width: 100,
          // height: 30,
          radius: 80.r,
        ),
        10.vs,
        CustomShimmer.fromRectangle(
          width: 150,
          height: 20,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        10.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3,
                (index) => CustomShimmer.fromRectangle(
              width: 100,
              height: 30,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
          ),
        ),
        20.vs,
        Expanded(
          child: Padding(
            padding: getPadding(horizontal: 10.h),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  5,
                      (index) => Padding(
                    padding: getPadding(vertical: 10.h),
                    child: CustomShimmer.fromRectangle(
                      width: width,
                      height: 70,
                      borderRadius:
                      BorderRadiusDirectional.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
