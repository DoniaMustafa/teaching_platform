import '../../../../core/export/export.dart';

class PasswordWidget extends StatelessWidget {
  PasswordWidget({super.key, required this.controller});
  FocusNode passwordFocusNode = FocusNode();
  String password = '';
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          keyboardType: TextInputType.visiblePassword,
          textInputType: TextInputType.visiblePassword,
          isPassword: true,
          focusNode: passwordFocusNode,
          textInputAction: TextInputAction.next,
          controller: controller,
          hintText: AppStrings().password.trans,
          validator: (String? phone) {
            if (phone!.validatePassword.isFalse) {
              context
                  .read<ErrorCubit>()
                  .addValidatorError(Errors.PASSWORD_ERROR);
            } else if (phone.validatePassword.isTrue) {
              context.read<ErrorCubit>().removeError(Errors.PASSWORD_ERROR);
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
                  .contains(Errors.PASSWORD_ERROR),
              text: getError[Errors.PASSWORD_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
