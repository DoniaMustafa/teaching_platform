import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching/core/managers/error_manager/error_cubit.dart';
import 'package:teaching/core/utils/app_strings.dart';
import 'package:teaching/core/widget/error_widget.dart';

import '../../../../core/export/export.dart';

class PhoneWidget extends StatelessWidget {
  PhoneWidget({super.key, required this.controller});

  FocusNode phoneFocusNode = FocusNode();
  String phoneNumber = '';
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          r: 10.r,
          controller: controller,
          keyboardType: TextInputType.phone,
          textInputType: TextInputType.phone,
          focusNode: phoneFocusNode,
          textInputAction: TextInputAction.next,
          validator: (phone) {
            print(phone);

            if (phone!.validatePhone.isFalse) {
              context.read<ErrorCubit>().addValidatorError(Errors.PHONE_ERROR);
            } else if (phone.validatePhone.isTrue) {
              context.read<ErrorCubit>().removeError(Errors.PHONE_ERROR);
            }
            return null;
          },
          hintText: AppStrings().phone.trans,
        ),
        BlocBuilder<ErrorCubit, ErrorState>(
          builder: (context, state) {
            return ErrorText(
              showError: context
                  .read<ErrorCubit>()
                  .errors
                  .contains(Errors.PHONE_ERROR),
              text: getError[Errors.PHONE_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
