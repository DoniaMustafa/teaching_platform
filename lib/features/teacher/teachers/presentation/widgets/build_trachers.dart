import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/teacher/teachers/data/models/teacher_respons_model.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_teacher_item.dart';

class BuildTeachers extends StatefulWidget {
  const BuildTeachers({super.key});

  @override
  State<BuildTeachers> createState() => _BuildTeachersState();
}

class _BuildTeachersState extends State<BuildTeachers> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TeachersOfStudentCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () =>
                  context.read<TeachersOfStudentCubit>().getTeacherOfStudent(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return CustomListView(
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              // shrinkWrap: true,
              separatorWidget: (BuildContext context, int index) => 20.vs,
              axisDirection: Axis.vertical,
              widget: (BuildContext context, int index) => state is LoadedState
                  ? BuildTeacherItem(
                      teacher: state.data[index],
                      onTap: () {
                        AppService()
                            .getBlocData<TeacherDetailsCubit>()
                            .getTeacherDetails(
                                model: TeacherModel(
                                    infoType:
                                        AppPrefs.userRole == "3" ? 3 : null,
                                    studentId: AppPrefs.userRole == "3"
                                        ? BuildChildrenDropDownList.childrenId
                                        : null,
                                    teacherId: state.data[index].id!),);
                        Routes.teacherDetailsRoute.moveTo;
                      },
                    )
                  : CustomShimmer.fromRectangle(
                      width: width,
                      height: 90,
                    ));
        },
      ),
    );
  }
}
// return
