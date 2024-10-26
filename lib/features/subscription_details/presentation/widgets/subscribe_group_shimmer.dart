import 'package:teaching/core/export/export.dart';

class SubscribeGroupShimmer extends StatelessWidget {
  const SubscribeGroupShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          30.vs,
          CustomShimmer.fromCircular(
            radius: 70.r,
          ),
          15.vs,
          CustomShimmer.fromRectangle(
            width: 100.w,
            height: 20.h,
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          10.vs,
          Row(
            children: List.generate(
              3,
                  (int index) => Expanded(
                child: Padding(
                  padding: getPadding(horizontal: 10.w),
                  child: CustomShimmer.fromRectangle(
                    // width: 50.w,
                    height: 25.h,
                    borderRadius: BorderRadiusDirectional.circular(5),
                  ),
                ),
              ),
            ),
          ),
          20.vs,
          CustomShimmer.fromRectangle(
            width: width,
            height: 70.h,
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          30.vs,
          Padding(
              padding: getPadding(horizontal: 10.w, bottom: 10),
              child: Column(
                children: List.generate(
                  5,
                      (index) => Padding(
                    padding: getPadding(bottom: 10.w),
                    child: CustomShimmer.fromRectangle(
                      width: width,
                      height: 65.h,
                      borderRadius:
                      BorderRadiusDirectional.circular(5),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
