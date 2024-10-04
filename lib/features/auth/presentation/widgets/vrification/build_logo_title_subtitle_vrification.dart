import 'package:teaching/core/export/export.dart';

class BuildLogoTitleSubtitleVerification extends StatelessWidget {
  const BuildLogoTitleSubtitleVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageWidget(
          asset: AppAssets().pinCode,
          width: 150.w,
          height: 150.h,
        ),
        40.vs,
        CustomTextWidget(
          text: 'ادخل الرمز المكون من اربع ارقام',
          style: getMediumTextStyle(
              fontFamily: FontFamilies.elMessiriFamily,
              fontSize: 22,
              color: AppColors.mainAppColor),
        ),
        10.vs,
        CustomTextWidget(
          align: TextAlign.center,
          text:
          'يجب ان يصلك الرمز المكون من اربع ارقام الي رقم هاتفك الذي ادخلته',
          style: getRegularTextStyle(
              fontFamily: FontFamilies.elMessiriFamily,
              fontSize: 14,
              color: AppColors.mainAppColor),
        ),
      ],
    );
  }
}
