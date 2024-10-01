import '../../../../core/export/export.dart';

class ConfirmPasswordWidget extends StatelessWidget {
  ConfirmPasswordWidget({super.key, required this.controller,required this.password});
  FocusNode confirmPasswordFocusNode = FocusNode();
  final TextEditingController controller;  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField( textInputType: TextInputType.visiblePassword,
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          focusNode: confirmPasswordFocusNode,
          textInputAction: TextInputAction.next,
          controller: controller,
          hintText: 'تأكيد كلمة المرور',
          validator: (String? confirmPassword) {

            if (confirmPassword!.validateConfirmPassword(password.text).isTrue) {
              context
                  .read<ErrorCubit>()
                  .removeError(Errors.CONFIRM_PASSWORD_ERROR);
            } else if (confirmPassword.validateConfirmPassword(password.text).isFalse) {
              context
                  .read<ErrorCubit>()
                  .addValidatorError(Errors.CONFIRM_PASSWORD_ERROR);
            }
            return null;
          },
        ),
        BlocBuilder<ErrorCubit, ErrorState>(
          builder: (context, state) {
            return ErrorText(
              showError: context
                  .read<ErrorCubit>()
                  .errors
                  .contains(Errors.CONFIRM_PASSWORD_ERROR),
              text: getError[Errors.CONFIRM_PASSWORD_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
