import 'package:teaching/core/widget/common_item_widgets/custom_item.dart';

import '../../../../core/export/export.dart';

class BuildLecturer extends StatelessWidget {
  const BuildLecturer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3 / 0.6,
      // height: 200.h,
      child: CustomListView( axisDirection: Axis.horizontal,
          separatorWidget: (context, index) => SizedBox(
                width: 20.w,
              ),
          itemCount: AppListsConstant.listOfStudentCategories.length,
          widget: (context, index) => _buildLecturerItem),
    );
  }

  get _buildLecturerItem => CustomCard(
      width: 130.w,
      boxShadow: [
        BoxShadow(
            color: AppColors.borderColor.withOpacity(0.3),
            offset: Offset(-1, 2),
            blurRadius: 5),
      ],
      radius: 10.r,
      // borderColor: AppColors.borderColor.withOpacity(0.2),
      // borderWidth: 1,
      padding: getPadding(
        top: 15.h,
        bottom: 10.h,
        // start: 15.w,
      ),
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNetworkImage.rectangle(
            width: 50.w,
            height: 50.h,
            imageUrl: AppAssets().student,
          ),
          10.vs,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'محمد السيد عدلي',
                  lines: 1,
                  style: getSemiboldTextStyle(
                    fontSize: 14,
                    color: AppColors.darkMainAppColor,
                    fontFamily: FontFamilies.dubaiFamily,
                  ),
                ),
                5.vs,
                CustomTextWidget(
                  text: 'التصميم,البرمجة',
                  style: getRegularTextStyle(
                    height: 1,
                    fontSize: 10,
                    fontFamily: FontFamilies.elMessiriFamily,
                  ),
                ),
                5.vs,
                CustomTextWidget(
                  text: '5 كورسات',
                  style: getRegularTextStyle(
                    height: 1,
                    fontSize: 10,
                    fontFamily: FontFamilies.elMessiriFamily,
                  ),
                ),
                5.vs,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: '2.2',
                      style: getMediumTextStyle(
                          height: 1,
                          fontSize: 10,
                          color: AppColors.yellow,
                          fontFamily: FontFamilies.elMessiriFamily),
                    ),
                    3.hs,
                    BuildRatingBar(
                      itemSize: 12,
                      itemCount: 5,
                      rate: 5,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ));
}
