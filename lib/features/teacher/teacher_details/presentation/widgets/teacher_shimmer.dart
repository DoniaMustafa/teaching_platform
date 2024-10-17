import 'package:teaching/core/export/export.dart';

class TeacherShimmer extends StatelessWidget {
  const TeacherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.vs,
        Row(
          children: [
            CustomShimmer.fromCircular(
              radius: 20.r,
            ),
            const Spacer(),
            CustomShimmer.fromRectangle(
              width: 100,
              height: 20.h,
              borderRadius: BorderRadiusDirectional.circular(5),
            ),
          ],
        ),
        20.vs,
        CustomShimmer.fromCircular(
          radius: 50.r,
        ),
        10.vs,
        CustomShimmer.fromRectangle(
          width: 140.w,
          height: 20.h,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        20.vs,
        CustomShimmer.fromRectangle(
          width: 150.w,
          height: 20.h,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        15.vs,
        CustomShimmer.fromRectangle(
          width: 135.w,
          height: 30.h,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        15.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Padding(
              padding: getPadding(end: 5.w),
              child: CustomShimmer.fromCircular(
                radius: 10,
              ),
            ),
          ),
        ),
        20.vs,
        Row(
          children: List.generate(
            3,
            (index) => Expanded(
              child: Padding(
                padding: getPadding(end: 5.w),
                child: CustomShimmer.fromRectangle(
                  width: 140.w,
                  height: 30.h,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
              ),
            ),
          ),
        ),
        25.vs,
        CustomShimmer.fromRectangle(
          width: width,
          height: 100.h,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        15.vs,
        CustomShimmer.fromRectangle(
          width: width,
          height: 100.h,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        15.vs,
        Row(
          children: List.generate(
              2,
              (index) => Expanded(
                    child: Padding(
                      padding: getPadding(end: 5.w),
                      child: CustomShimmer.fromRectangle(
                        // width:width,
                        height: 100.h,
                        borderRadius: BorderRadiusDirectional.circular(5),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
