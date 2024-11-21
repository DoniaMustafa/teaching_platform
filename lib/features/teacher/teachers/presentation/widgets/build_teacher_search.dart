import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_student_cubit.dart';

class BuildTeacherSearch extends StatefulWidget {
  BuildTeacherSearch({
    super.key,
  });

  @override
  State<BuildTeacherSearch> createState() =>
      _BuildCoursesAndGroupsSearchWidgetState();
}

class _BuildCoursesAndGroupsSearchWidgetState extends State<BuildTeacherSearch>
    with SearchVariables {
  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 50,
      end: 10,
      start: 10,
      child: BlocBuilder<TeachersOfStudentCubit, CubitStates>(
        builder: (context, state) {
          return CustomTextFormField(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            isFill: true,
            controller: teacherController,
            onChanged: (String input) {
              teacherController.text = input;

              setState(() {});
              context
                  .read<TeachersOfStudentCubit>()
                  .searchInList(teacherController.text);
            },
          );
        },
      ),
    );
  }
}
