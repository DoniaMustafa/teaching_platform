import 'package:teaching/core/widget/shimmer_widget.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';

import '../../../../core/export/export.dart';
import '../../../courses_groups/presentation/manager/public_course_cubit.dart';

class BuildCourses extends StatelessWidget {
  const BuildCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicCourseCubit, CubitStates>(builder: (context, state) {
      if (state is FailedState) {
        return CustomErrorWidget(
          onTap: () => context.read<PublicCourseCubit>().getPublicCourses(),
          message: state.message,
        );
      }
      if (state is LoadedState && state.data.isEmpty) {
        return const SizedBox.shrink();
      }
      return AspectRatio(
          aspectRatio: 1.5 / 0.9, child: buildCoursesList(state));
    });
  }

  Widget buildCoursesList(CubitStates state) {
    return CustomListView( axisDirection: Axis.horizontal,
        separatorWidget: (context, index) => SizedBox(
              width: 20.w,
            ),
        itemCount: state is LoadedState
            ? state.data.length
            : AppConstants.nShimmerItems,
        widget: (context, index) => state is LoadedState
            ? CustomItem(
                onTap: () {  AppService()
                    .getBlocData<CoursesGroupOperationCubit>().selectedIndex = null;
                  print(state.data[index].subjectId);
                  context.read<CoursesDetailsCubit>().getCoursesDetails(
                      TeacherModel(
                          subjectId: state.data[index].subjectId!,
                          teacherId: state.data[index].teacherId!));
                  Routes.coursesDetailsRoute.moveToWithArgs({
                    // CoursesDetailsScreen.whichScreenKey: 'TeacherDetails',
                    // CoursesDetailsScreen.subjectNameKey:
                    //     state.data[index].subjectId!,
                    CoursesDetailsScreen.teacherIdKey:
                        state.data[index].teacherId!
                  });

                },
                coursesModel: state.data[index],
              )
            : CustomShimmer.fromRectangle(
                height: 150.h,
                borderRadius: BorderRadiusDirectional.circular(20.r),
                width: 200,
              ));
  }
}
