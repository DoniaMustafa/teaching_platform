import 'package:pinput/pinput.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';

import '../../../../../core/export/export.dart';

class BuildPinCode extends StatefulWidget {
  const BuildPinCode({super.key});
  static TextEditingController pinController = TextEditingController();

  @override
  State<BuildPinCode> createState() => _BuildPinCodeState();
}

class _BuildPinCodeState extends State<BuildPinCode> {

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
      width: 55.w,
      height: 50.h,
      // padding: getPadding(horizontal: 5),
      margin: getMargin(horizontal: 5),
      textStyle: getRegularTextStyle(fontSize: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          controller: BuildPinCode.pinController,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          validator: (otp) {
            // pinController.text = otp!;
            print( BuildPinCode.pinController.text);
            if (otp!.validateOtp.isFalse) {
              BlocProvider.of<ErrorCubit>(context)
                  .addValidatorError(Errors.OTP_ERROR);
            } else if (otp.validateOtp.isTrue) {
              BlocProvider.of<ErrorCubit>(context)
                  .removeError(Errors.OTP_ERROR);
            }
            return null;
          },
        ),
        BlocBuilder<ErrorCubit, ErrorState>(
          builder: (context, state) {
            return ErrorText(
              showError: BlocProvider.of<ErrorCubit>(context)
                  .errors
                  .contains(Errors.OTP_ERROR),
              text: getError[Errors.OTP_ERROR]!.trans,
            );
          },
        )
      ],
    );
  }

  bool showRedBorder(BuildContext context, int index) {
    bool isError =
        context.read<ErrorCubit>().errors.contains(Errors.OTP_ERROR).isTrue;
    if (isError) {
      if ( BuildPinCode.pinController.text.isNullOrEmpty) {
        return true;
      } else if (index + 1 >  BuildPinCode.pinController.text.length) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
