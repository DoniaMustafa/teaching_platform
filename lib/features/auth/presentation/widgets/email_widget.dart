import 'package:teaching/core/export/export.dart';

class EmailWidget extends StatelessWidget {
  EmailWidget({super.key, required this.controller});
  FocusNode emailFocusNode = FocusNode();
  String emailNumber = '';
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          textInputType: TextInputType.emailAddress,
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          textInputAction: TextInputAction.next,
          controller: controller,
          hintText: AppStrings().emailHint.trans,
          validator: (String? email) {
            emailNumber = email!;
            if (email.validateEmail.isFalse) {
              context.read<ErrorCubit>().addValidatorError(Errors.EMAIL_ERROR);
            } else if (email.validateEmail.isTrue) {
              context.read<ErrorCubit>().removeError(Errors.EMAIL_ERROR);
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
                  .contains(Errors.EMAIL_ERROR),
              text: getError[Errors.EMAIL_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
