import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';

import '../../../../../../core/export/export.dart';
import '../../../../data/models/contry_response_model.dart';
import '../../../manager/education/education_cubit.dart';

class BuildEducationStage extends StatelessWidget {
  BuildEducationStage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageCubit, StageState>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
              items: getItems(state),
              onSelected: (int id) {
                context.read<StageCubit>().gradeId = id;
                // context.read<EducationCubit>().getEducationPrograms(id: id);
              },
              title: AppStrings().stage.trans,
              status: getListStatus(state),
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

  List<PublicDataModel> getItems(StageState state) {
    if (state is GradeLoadedState) return state.data;
    return [];
  }

  ListStatus getListStatus(StageState state) {
    if (state is GradeFailureState) return ListStatus.listError;
    if (state is GradeLoadedState) return ListStatus.listLoaded;
    return ListStatus.listLoading;
  }
}
