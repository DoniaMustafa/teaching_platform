import '../../../../../core/export/export.dart';

class BuildChooseRoleAppBar extends StatelessWidget {
  const BuildChooseRoleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      color: AppColors.appBarColor,
      child: Row(
        children: [
          Expanded(
              child: Align(
            alignment: AlignmentDirectional.center,
            child: CustomTextWidget(
              text: AppStrings().chooseRole.trans,
              style: getBoldTextStyle(fontSize: 24, color: AppColors.white),
            ),
          )),
          CustomCircleWidget(
            height: 26.h,
            margin: getMargin(end: 24.w),
            width: 27.h,
            alignment: AlignmentDirectional.center,
            padding: getPadding(start: 5.w),
            color: AppColors.white,
            radius: 5.r,
            child: const CustomIcon(
              icon: Icons.arrow_forward_ios,
              size: 15,
              color: AppColors.mainAppColor,
            ),
          ),
        ],
      ),
    );
  }
}
