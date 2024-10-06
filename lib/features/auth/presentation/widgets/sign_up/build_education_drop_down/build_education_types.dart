import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';

import '../../../../../../core/export/export.dart';
import '../../../../data/models/contry_response_model.dart';
import '../../../manager/education/education_cubit.dart';

class BuildEducationMaterial extends StatefulWidget {
  BuildEducationMaterial({super.key});

  @override
  State<BuildEducationMaterial> createState() => _BuildEducationMaterialState();
}

class _BuildEducationMaterialState extends State<BuildEducationMaterial> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
              items: getItems(state),
              onSelected: (int id) {
                context.read<EducationCubit>().typeId = id;
                context.read<ProgramCubit>().getEducationPrograms(
                    id: context.read<EducationCubit>().typeId!);
              },
              title: AppStrings().material.trans,
              status: getListStatus(state)!,
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
      },
    );
  }

  List<PublicDataModel> getItems(EducationState state) {
    if (state is EducationTypeLoadedState) return state.data;
    return [];
  }

  ListStatus? getListStatus(EducationState state) {
    if (state is EducationTypeFailureState) return ListStatus.listError;
    if (state is EducationTypeLoadedState) return ListStatus.listLoaded;
    if (state is EducationTypeLoadingState) return ListStatus.listLoading;
    return null;
  }
}
