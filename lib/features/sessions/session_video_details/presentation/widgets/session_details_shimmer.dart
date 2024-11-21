
import '../../../../../core/export/export.dart';

class CoursesLessonDetailsShimmer extends StatelessWidget {
  const CoursesLessonDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShimmer(
          width: width,
          height: 200,
          borderRadius: BorderRadiusDirectional.circular(0),
        ),
        10.vs,
        Padding(
          padding: getPadding(horizontal: 10.w),
          child: Row(
            children: [
              CustomShimmer(
                width: 120,
                height: 20,
                borderRadius: BorderRadiusDirectional.circular(5),
              ),
              Spacer(),
              Row(
                children: List.generate(
                    3,
                        (i) => Padding(
                      padding: getPadding(end: 5.w),
                      child:  CustomShimmer(
                        width: 50,
                        height: 20,
                        borderRadius:
                        BorderRadiusDirectional.circular(5),
                      ),
                    )),
              ),
            ],
          ),
        ),
        30.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
                  (i) => Expanded(
                child: Padding(
                  padding: getPadding(horizontal: 5.w),
                  child: CustomShimmer(
                    // width: 80.w,
                    height: 20,
                    borderRadius:
                    BorderRadiusDirectional.circular(5),
                  ),
                ),
              )),
        ),
        20.vs,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(5,(i)=>Padding(
                padding:getPadding(vertical: 5.h,horizontal: 10.w),
                child: CustomShimmer(
                  width: width,
                  height: 100,
                  borderRadius:
                  BorderRadiusDirectional.circular(5),
                ),
              )),
            ),
          ),
        )
      ],
    );
  }
}
