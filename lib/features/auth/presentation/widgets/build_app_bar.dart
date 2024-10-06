import '../../../../core/export/export.dart';

class BuildBackgroundWithAppBar extends StatelessWidget {
  const BuildBackgroundWithAppBar(
      {super.key, required this.child, this.userType});
  final Widget child;
  final String? userType;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.appBarColor,
        appbarColor: AppColors.appBarColor,
        showAppbar: true,
        showBack: true,
        widget: Row(
          children: [
            Expanded(
              child: CustomTextWidget(
                text: EnumService.registerType(SignUpByPhoneScreen.userType),
                overflow: TextOverflow.visible,
                style: getSemiboldTextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontFamily: FontFamilies.elMessiriFamily),
              ),
            ),
            20.hs,
            // Row(
            //   children: List.generate(
            //       3,
            //       (index) => Padding(
            //             padding: getPadding(horizontal: 15.w),
            //             child: CustomTextWidget(
            //               text: '${index + 1}',
            //               style: getRegularTextStyle(
            //                   fontSize: 16, color: AppColors.white),
            //             ),
            //           )),
            // ),
            // 10.hs,
          ],
        ),
        backgroundColor: AppColors.fillColor,
        showSafeArea: true,
        child: child);
  }
}
