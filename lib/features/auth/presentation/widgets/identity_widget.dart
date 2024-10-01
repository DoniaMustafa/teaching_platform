import 'package:teaching/core/export/export.dart';

class IdentityWidget extends StatelessWidget {
  IdentityWidget({super.key, required this.controller});
  FocusNode identityFocusNode = FocusNode();
  String identity = '';
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField( textInputType: TextInputType.number,
          keyboardType: TextInputType.number,
          focusNode: identityFocusNode,
          textInputAction: TextInputAction.next,
          controller: controller,
          hintText: 'الرقم القومي',
          validator: (String? id) {
            print("id is $id");
            identity = id!;
            if (id.validateIdentity.isFalse) {
              context
                  .read<ErrorCubit>()
                  .addValidatorError(Errors.IdentityL_ERROR);
            } else if (id.validateIdentity.isTrue) {
              context.read<ErrorCubit>().removeError(Errors.IdentityL_ERROR);
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
                  .contains(Errors.IdentityL_ERROR),
              text: getError[Errors.IdentityL_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
