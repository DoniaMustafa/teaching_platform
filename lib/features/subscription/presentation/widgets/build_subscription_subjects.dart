import 'package:teaching/core/export/export.dart';

class BuildSubscriptionSubjects extends StatelessWidget {
  const BuildSubscriptionSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: CustomListView(
          itemCount: 5,
          widget: (context, index) => Column(
                children: [
                  Expanded(
                    child: CustomCard(
                        margin: getMargin(horizontal: 5.w),
                        backgroundColor: AppColors.mainAppColor.withOpacity(0.9),
                        padding: getPadding(vertical: 20.h, horizontal: 20.w),
                        child: CustomImageWidget(
                          asset: AppAssets().exam,
                          height: 40.h,
                          width: 40.w,
                        )),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: 'لغة عربيه',
                    style: getRegularTextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              )),
    );
  }
}
