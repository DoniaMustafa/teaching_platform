import 'package:teaching/core/export/export.dart';

class BuildSubjectsList extends StatelessWidget {
  BuildSubjectsList({super.key});
  static int? subjectSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsCubit, CubitStates>(
      builder: (context, state) {
        return ExpansionTileDropDown(
            onSelected: (
              int id,
            ) {
              subjectSelected = id;

              context.read<TeachersOfStudentCubit>().getTeacherOfStudent(
                  teacher: TeacherModel(studentId: subjectSelected));
            },
            items: getItems(state)!,
            title: AppStrings().material.trans,
            status: getListStatus(state));
      },
    );
  }

  List<PublicDataModel>? getItems(CubitStates state) {
    if (state is LoadedState) return state.data;

    return [];
  }

  ListStatus getListStatus(CubitStates state) {
    if (state is FailedState) return ListStatus.listError;
    if (state is LoadingState) return ListStatus.listLoading;

    // if (state is GradeLoadedState) return ListStatus.listLoaded;
    return ListStatus.listLoaded;
  }
}
