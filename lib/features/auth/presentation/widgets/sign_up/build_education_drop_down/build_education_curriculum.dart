import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';

import '../../../../../../core/export/export.dart';
import '../../../manager/education/education_cubit.dart';
import '../../../manager/education/stage/stage_cubit.dart';

class BuildEducationCurriculum extends StatelessWidget {
  BuildEducationCurriculum({super.key});

  int? curriculum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramCubit, ProgramState>(
      builder: (context, state) {
          return Column(
            children: [
              ExpansionTileDropDown(
                items: getItems(state),
                onSelected: (int id) {
                  context.read<ProgramCubit>().curriculumId = id;
                  context.read<StageCubit>().getGrade(
                    educationProgramsId:
                    context.read<ProgramCubit>().curriculumId!,
                    educationTypeId: context.read<EducationCubit>().typeId!,
                  );
                },
                title: AppStrings().curriculum.trans,
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

  List<PublicDataModel> getItems(ProgramState state) {
    if (state is EducationProgramsLoadedState) return state.data;

    return [];
  }

  ListStatus? getListStatus(ProgramState state) {
    if (state is EducationProgramsFailureState) return ListStatus.listError;
    // if (state is EducationProgramsLoadedState) return ListStatus.listLoaded;
    if (state is EducationProgramsLoadingState) return ListStatus.listLoading;
    return ListStatus.listLoaded;
  }
}
