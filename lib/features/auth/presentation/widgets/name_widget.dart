import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching/core/managers/error_manager/error_cubit.dart';
import 'package:teaching/core/widget/error_widget.dart';

import '../../../../core/export/export.dart';

class NameWidget extends StatelessWidget {
  NameWidget({super.key, required this.controller});

  FocusNode nameFocusNode = FocusNode();
  String userName = '';
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: controller,
          textInputType: TextInputType.name,
          keyboardType: TextInputType.name,
          focusNode: nameFocusNode,
          textInputAction: TextInputAction.next,
          validator: (String? name) {
            print("name is $name");
            userName = name!;
            if (name.validateName.isFalse) {
              context.read<ErrorCubit>().addValidatorError(Errors.NAME_ERROR);
            } else if (name.validateName.isTrue) {
              context.read<ErrorCubit>().removeError(Errors.NAME_ERROR);
            }
            return null;
          },
          hintText: AppStrings().userNameHint.trans,
        ),
        BlocBuilder<ErrorCubit, ErrorState>(
          builder: (context, state) {
            return ErrorText(
              showError:
                  context.read<ErrorCubit>().errors.contains(Errors.NAME_ERROR),
              text: getError[Errors.NAME_ERROR]!,
            );
          },
        )
      ],
    );
  }
}
