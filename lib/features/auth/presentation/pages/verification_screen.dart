import 'package:pinput/pinput.dart';
import 'package:teaching/config/routes/app_routes_helper.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/widgets/vrification/build_logo_title_subtitle_vrification.dart';
import 'package:teaching/features/auth/presentation/widgets/vrification/build_pin_code.dart';

import '../../../../core/export/export.dart';

// mixin PinCodeVariable {
//   TextEditingController pinController = TextEditingController();
// }
class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final formKey = GlobalKey<FormState>();
  static const String phoneKey = 'phoneKey';
  String phone = 'phone';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      phone = data![phoneKey];
    }

    return CustomBackground(
        backgroundColor: AppColors.fillColor,
        showBack: true,
        showAppbar: true,
        appbarColor: AppColors.mainAppColor,
        statusBarColor: AppColors.mainAppColor,
        child: Padding(
          padding: getPadding(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                100.vs,
                const BuildLogoTitleSubtitleVerification(),
                50.vs,
                _buildPinCode,
                40.vs,
                _buildEditPhone,
                30.vs,
                _buildSendData,
                50.vs,
              ],
            ),
          ),
        ));
  }

  get _buildPinCode => Form(
        key: formKey,
        child: const BuildPinCode(),
      );
  get _buildSendData => BuildNextButton(
        text: 'ارسال',
        onTap: () {
          formKey.currentState!.validate();
          if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
            AppService().getBlocData<UserCubit>().verifyOTP(
                user: UserModel(
                    phoneNumber: phone,
                    verifyCode: BuildPinCode.pinController.text));
          }
        },
      );

  get _buildEditPhone => GestureDetector(
        onTap: () => pop(),
        child: CustomTextWidget(
          text: 'تعديل الرقم',
          style: getRegularTextStyle(
              fontFamily: FontFamilies.elMessiriFamily,
              fontSize: 14,
              decorationColor: AppColors.darkMainAppColor,
              color: AppColors.darkMainAppColor,
              decoration: TextDecoration.underline),
        ),
      );
}
