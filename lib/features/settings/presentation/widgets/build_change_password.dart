import 'package:teaching/core/export/export.dart';

class BuildChangePassword extends StatelessWidget {
  BuildChangePassword({super.key});
  final finalKey=GlobalKey<FormState>();
TextEditingController oldPass=TextEditingController();
  TextEditingController newPass=TextEditingController();
  TextEditingController confirmPass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.vs,
          CustomDivider(
            height: 6.h,
            radius: 10,
            width: 100.w,
            color: AppColors.profileDivider,
          ),
          20.vs,
          Text(
            AppStrings().changePassword.trans,
            style: getBoldTextStyle(
              fontSize: 16,
              fontFamily: FontFamilies.dubaiFamily,
            ),
          ),
          40.vs,
          Form(
            key: finalKey,
              child: Column(
                children: [
                  PasswordWidget(
                    hintText: AppStrings().enterOldPassword.trans,
                    controller:oldPass,
                  ),
                  20.vs,
                  PasswordWidget(
                    // isShadow: false,
                    // password: password,
                    controller: newPass,
                  ),
                  20.vs,
                  ConfirmPasswordWidget(
                    controller: confirmPass,
                    password: oldPass,
                  ),
                ],
              )),
          30.vs,
          CustomElevatedButton(
              onPressed: () {
                if (finalKey.currentState!.validate() &&
                    oldPass.text.isNotEmpty &&
                    // confirmPasswordController.text.isNotEmpty &&
                    newPass.text.isNotEmpty) {
                  AppService()
                      .getBlocData<UserCubit>()
                      .updatePassword(

                        oldPassword: oldPass.text,
                        confirmPassword: confirmPass.text,

                        newPassword: newPass.text,
                      );
                }
              },
              text: AppStrings().changePassword.trans),
          20.vs,
        ],
      ),
    );
  }
}
