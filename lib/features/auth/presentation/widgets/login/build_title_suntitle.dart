import 'package:teaching/core/utils/app_strings.dart';

import '../../../../../core/export/export.dart';

class BuildTitleSubtitleImage extends StatelessWidget {
  const BuildTitleSubtitleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(start: 5.w,top: 30.h),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: AppStrings().login.trans,
            style: getSemiboldTextStyle(
                fontFamily: FontFamilies.elMessiriFamily,
                fontSize: 20,
                height: 2,letterSpacing: 1.15,
                color: AppColors.mainAppColor),
          ),
          CustomTextWidget(
            text: AppStrings().welcomeTo.trans,
            style: getSemiboldTextStyle(
                fontFamily: FontFamilies.elMessiriFamily,
                fontSize: 20,letterSpacing: 1.15,
                color: AppColors.mainAppColor),
          ),
          10.vs,
         CustomImageWidget(
            asset: AppAssets().loginImage,
            height: 200.h,
            width: 200.w,
          ),
        ],
      ),
    );
  }
}
