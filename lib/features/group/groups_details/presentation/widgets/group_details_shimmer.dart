import 'package:teaching/core/export/export.dart';

class GroupDetailsShimmer extends StatelessWidget {
  const GroupDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.vs,
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
        Row(
          children: List.generate(
            3,
            (index) => Expanded(
              child: Padding(
                padding: getPadding(horizontal: 10),
                child: CustomShimmer.fromRectangle(
                  width: 140.w,
                  height: 30.h,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
              ),
            ),
          ),
        ),
        20.vs,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                6,
                (index) => Padding(
                  padding: getPadding(horizontal: 10.w, bottom: 10.h),
                  child: CustomShimmer.fromRectangle(
                    width: width,
                    height: 80.h,
                    borderRadius: BorderRadiusDirectional.circular(5),
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
