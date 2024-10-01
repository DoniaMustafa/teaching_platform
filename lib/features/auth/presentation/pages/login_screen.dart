import 'package:teaching/features/auth/presentation/widgets/login/build_new_register.dart';
import 'package:teaching/features/auth/presentation/widgets/login/build_title_suntitle.dart';

import '../../../../core/export/export.dart';
import '../manager/user_cubit/user_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      statusBarColor: AppColors.fillColor,
      backgroundColor: AppColors.fillColor,
      child: Padding(
        padding: getPadding(start: 29.w, end: 18.w),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BuildTitleSubtitleImage(),
              30.vs,
              _buildInputForms,
              17.vs,
              _buildForgetPass,
              30.vs,
              _buildLogin,
              10.vs,
              const BuildNewRegister(),
            ],
          ),
        ),
      ),
    );
  }

  get _buildInputForms => Form(
    key: _formKey,
    child: Column(
          children: [
            PhoneWidget(
              controller: _phoneController,
            ),
            24.vs,
            PasswordWidget(
              controller: _passwordController,
            ),
          ],
        ),
  );

  get _buildForgetPass => GestureDetector(
        onTap: () => Routes.forgetPassRoute.moveTo,
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: getPadding(start: 20.w),
            child: CustomTextWidget(
              text: AppStrings().forgetPassword.trans,
              align: TextAlign.end,
              style: getRegularTextStyle(color: AppColors.mainAppColor),
            ),
          ),
        ),
      );
  get _buildLogin => CustomElevatedButton(
        onPressed: () {
          _formKey.currentState!.validate();
          if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
            AppService().getBlocData<UserCubit>().login(
                  phone: _phoneController.text,
                  password: _passwordController.text,
                );
          }
        },
        text: AppStrings().login.trans,
        style: getMediumTextStyle(
            fontFamily: FontFamilies.elMessiriFamily,
            fontSize: 18,
            color: AppColors.white),
      );
}
