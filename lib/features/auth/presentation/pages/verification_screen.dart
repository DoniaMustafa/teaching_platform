import 'package:pinput/pinput.dart';
import 'package:teaching/config/routes/app_routes_helper.dart';

import '../../../../core/export/export.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late PinTheme defaultPinTheme;

  late PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(
      color: AppColors.borderColor2,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  late PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: AppColors.borderColor2,
    ),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      margin: getMargin(horizontal: 20),
      textStyle: getRegularTextStyle(fontSize: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                50.vs,
                _buildPinCode,
                40.vs,
                GestureDetector(
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
                ),
                30.vs,
                BuildNextButton(text: 'ارسال'),
                50.vs,
              ],
            ),
          ),
        ));
  }

  final formKey = GlobalKey<FormState>();

  /// Validate manually
  /// Don't call validate in build method, this is just illustration.

  get _buildPinCode => Form(
        key: formKey,
        child: Pinput(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          validator: (pin) {
            if (pin == '2224') return null;

            return 'Pin is incorrect';
          },
        ),
      );
}
