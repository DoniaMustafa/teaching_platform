import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';

import '../../../../core/export/export.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              80.vs,
              CustomTextWidget(
                text: AppStrings().resetPassword.trans,
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

              50.vs,
              Form(
                  key: _formKey, child: PasswordWidget(controller: controller)),
              // Spacer(),
              100.vs,
              BuildNextButton(
                text: AppStrings().continuation.trans,
                onTap: () {
                  _formKey.currentState!.validate();
                  if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
                    AppService().getBlocData<UserCubit>().resetPassword(
                            user: UserModel(
                          phoneNumber: VerificationScreen.phone,
                          password: controller.text,
                        )
                            // password: _passwordController.text,
                            );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
