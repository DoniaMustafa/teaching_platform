import 'package:teaching/core/export/export.dart';

class BuildSchoolShimmer extends StatelessWidget {
  const BuildSchoolShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        40.vs,
        CustomShimmer(
          width: 150,
          height: 20,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        20.vs,
        CustomShimmer(
          width: width,
          height: 200,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        20.vs,
        Expanded(
          child: Padding(
            padding: getPadding(horizontal: 20.w),
            child: Column(
              children: [
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                5.vs,
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                5.vs,
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                5.vs,
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                5.vs,
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                5.vs,
                CustomShimmer(
                  width: width,
                  height: 20,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                20.vs,
                Row(
                  children: [
                    CustomShimmer(
                      width: 100,
                      height: 20,
                      borderRadius:
                      BorderRadiusDirectional.circular(5),
                    ),
                    const Spacer(),
                    CustomShimmer(
                      width: 100,
                      height: 20,
                      borderRadius:
                      BorderRadiusDirectional.circular(5),
                    ),
                  ],
                ),
                20.vs,
                Row(
                  children: [
                    CustomShimmer(
                      width: 100,
                      height: 20,
                      borderRadius:
                      BorderRadiusDirectional.circular(5),
                    ),
                    const Spacer(),
                    CustomShimmer(
                      width: 100,
                      height: 20,
                      borderRadius:
                      BorderRadiusDirectional.circular(5),
                    ),
                  ],
                ),
                const Spacer(),
                CustomShimmer(
                  width: width,
                  height: 30,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                40.vs,
              ],
            ),
          ),
        )
      ],
    );
  }
}
