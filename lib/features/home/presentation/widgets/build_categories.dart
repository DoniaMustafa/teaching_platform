import 'package:teaching/core/enums.dart';

import '../../../../core/export/export.dart';

class BuildCategories extends StatelessWidget {
  const BuildCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: CustomListView(
        separatorWidget: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: RoleType.student.isTrue
            ? AppListsConstant.listOfStudentCategories.length
            : AppListsConstant.listOfTeacherCategories.length,
        widget: (context, index) => Column(
          children: [
            CustomCard(
                gradient: const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      AppColors.borderColor,
                      AppColors.gradient1
                    ]),
                radius: 10.r,
                padding: getPadding(vertical: 10.h,horizontal: 15.w),
                backgroundColor: AppColors.mainAppColor,
                child: CustomImageWidget(
                    height: 40.h,
                    width: 41.w,
                    asset: AppAssets().listOfStudentCategories[index])),
            5.vs,
            CustomTextWidget(
              text: RoleType.student.isTrue
                  ? AppListsConstant.listOfStudentCategories[index].title!
                  : AppListsConstant.listOfTeacherCategories[index].title!,
              style: getRegularTextStyle(
                  fontSize: 14, fontFamily: FontFamilies.dubaiFamily),
            )
          ],
        ),
      ),
    );
  }
}
