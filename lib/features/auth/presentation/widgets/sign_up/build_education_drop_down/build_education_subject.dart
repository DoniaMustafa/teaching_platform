import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/subject/subject_cubit.dart';

import '../../../../../../core/export/export.dart';
import '../../../manager/education/education_cubit.dart';
import '../../../manager/education/stage/stage_cubit.dart';

class BuildEducationSubject extends StatelessWidget {
  BuildEducationSubject({super.key});

  int? curriculum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectCubit, SubjectState>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
              items: getItems(state),
              onSelected: (int id) {
                context.read<SubjectCubit>().subjectsId = id;
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

  List<PublicDataModel> getItems(SubjectState state) {
    if (state is SubjectLoadedState) return state.data;
      return [];

  }

  ListStatus? getListStatus(SubjectState state) {
    if (state is SubjectFailureState) return ListStatus.listError;
    // if (state is EducationProgramsLoadedState) return ListStatus.listLoaded;
    if (state is SubjectLoadingState) return ListStatus.listLoading;
    return ListStatus.listLoaded;
  }
}
