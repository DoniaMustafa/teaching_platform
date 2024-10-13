import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../../../../core/export/export.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController controller = TextEditingController();
  final _formKey=GlobalKey<FormState>();
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
                  text: AppStrings().forgetPassword.trans,
                  style: getMediumTextStyle(
                      fontFamily: FontFamilies.elMessiriFamily,
                      fontSize: 22,
                      color: AppColors.mainAppColor),
                ),
                CustomTextWidget(
                  text: AppStrings().forgetPasswordTitle.trans,
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
                Form(
                    key: _formKey,
                    child: PhoneWidget(controller: controller)),
                // Spacer(),
                100.vs,
                BuildNextButton(
                  text: AppStrings().continuation.trans,
                  onTap: () {
                    _formKey.currentState!.validate();
                    if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
                      AppService().getBlocData<UserCubit>().forgetPassword(
                        phone: controller.text,
                        // password: _passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
