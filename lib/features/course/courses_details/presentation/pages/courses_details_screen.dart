import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/build_courses_component.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/build_list_of_lessons.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/courses_detauls_shimmer.dart';

class CoursesDetailsScreen extends StatelessWidget {
  CoursesDetailsScreen({super.key});
  static const String teacherIdKey = 'teacherNameKey';
  // static const String subjectNameKey = 'subjectNameKey';
  static const String whichScreenKey = 'whichScreenKey';
  static int teacherId = 0;
  // String subjectName = '';
  String whichScreen = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = getArguments(context)!;
    if (data.isNotNull) {
      teacherId = data[teacherIdKey];
      // subjectName = data[subjectNameKey];
      whichScreen = data[whichScreenKey] ?? 'default';
    }
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().coursesDetails.trans,
          widget: BlocBuilder<CoursesDetailsCubit, CubitStates>(
            builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(
                    message: state.message,
                    onTap: () => context
                        .read<CoursesDetailsCubit>()
                        .getCoursesDetails(TeacherModel(
                          teacherId: teacherId,
                        )));
              }
              if (state is LoadedState && state.data.isEmpty) {
                return const CustomEmptyWidget();
              }
              if (state is LoadedState) {
                return buildCoursesDetails(state.data[0]);
              }
              return const CoursesDetailsShimmer();
            },
          )),
    );
  }

  buildCoursesDetails(TeacherModel model) => Column(
        children: [
          20.vs,
          BuildCoursesHeaderComponent(
            model: model,
          ),
          if (whichScreen == AppStrings().teacherDetails)
            CustomSubjectList(
              teacherId: model.teacherId,
            ),
          BuildListOfLessons(
            model: model,
          ),
        ],
      );
}
