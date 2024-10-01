import '../../../../core/export/export.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        appbarColor: AppColors.mainAppColor,
        backgroundColor: AppColors.white,
        showAppbar: true,
        showBack: true,
        child: Padding(
          padding: getPadding(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                80.vs,
                CustomTextWidget(
                  text: 'نسيت كلمة المرور؟',
                  style: getMediumTextStyle(
                      fontFamily: FontFamilies.elMessiriFamily,
                      fontSize: 22,
                      color: AppColors.mainAppColor),
                ),
                CustomTextWidget(
                  text: 'ادخل رقم الهاتف هنا لاعادة تعين كلمة المرور',
                  style: getRegularTextStyle(
                      fontFamily: FontFamilies.elMessiriFamily,
                      fontSize: 16,
                      color: AppColors.mainAppColor),
                ),
                20.vs,
                CustomImageWidget(
                  asset: AppAssets().forgetPass,
                  width: 150.w,
                  height: 150.h,
                ),
                30.vs,
                PhoneWidget(controller: controller),
                // Spacer(),
                100.vs,
                BuildNextButton(text: 'استمر',onTap: ()=>Routes.verificationRoute.moveTo,),
              ],
            ),
          ),
        ));
  }
}
