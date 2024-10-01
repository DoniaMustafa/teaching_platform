import 'package:teaching/core/widget/common_item_widgets/custom_item.dart';

import '../../../../core/export/export.dart';

class BuildFeatures extends StatelessWidget {
  const BuildFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: CustomListView(
          separatorWidget: (context, index) => SizedBox(
                width: 20.w,
              ),
          itemCount: AppListsConstant.listOfStudentCategories.length,
          widget: (context, index) => _buildFeaturesItem),
      // child: GridView.builder(
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   padding: getPadding(horizontal: 20.w),
      //   itemCount: AppListsConstant.listOfTeacherCategories.length,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.9/0.68,
      //       crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 6),
      //   itemBuilder: (_, index) => _buildFeaturesItem,
      // ),
    );
  }

  get _buildFeaturesItem => CustomCard(
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 5),
          ],
          radiusDirectional: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15), bottomStart: Radius.circular(15)),
          borderColor: AppColors.textGrayColor1.withOpacity(0.2),
          borderWidth: 1,
          padding: getPadding(vertical: 15.h, horizontal: 20.w),
          backgroundColor: AppColors.white,
          child: Column(
            children: [
              CustomNetworkImage.rectangle(
                width: 50.w,
                height: 50.h,
                imageUrl: AppAssets().student,
              ),
              20.vs,
              Expanded(
                  child: CustomTextWidget(
                text: 'درس لغه عربية',
                style: getBoldTextStyle(
                  fontSize: 16,
                  fontFamily: FontFamilies.abhayaLibreFamily,
                ),
              ))
            ],
          ));
}
