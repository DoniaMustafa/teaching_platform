import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';

import '../../../../core/export/export.dart';
import '../manager/public_course_cubit.dart';

class BuildPublicCourses extends StatelessWidget {
  const BuildPublicCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PublicCourseCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context
                  .read<PublicCourseCubit>()
                  .getPublicCourses(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return GridView.count(
            crossAxisCount: 2,
            padding: getPadding(horizontal: 10.w, top: 40.h, bottom: 20.h),
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 20.w,
            shrinkWrap: true,
            childAspectRatio: 0.5 / 0.6,
            children: List.generate(
              state is LoadedState
                  ? state.data.length
                  : AppConstants.nShimmerItems,
              (index) {
                if (state is LoadedState) {
                  return buildTeachersItem(state.data[index]);
                } else {
                  return CustomShimmer.fromRectangle(
                    borderRadius: BorderRadiusDirectional.circular(10.r),
                    height: 150.h,
                    width: 200,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildTeachersItem(CoursesModel data) => CustomItem(
      onNavigateTap: () {
        // AppService().getBlocData<CoursesCubit>().getCourser(
        //     model: TeacherModel(
        //         subjectId: data.subjectId!, teacherId: data.teacherId!));
        AppService()
            .getBlocData<CoursesDetailsCubit>()
            .getCoursesDetails(TeacherModel(teacherId: data.teacherId!));
        Routes.coursesDetailsRoute.moveToWithArgs({
          // CoursesDetailsScreen.whichScreenKey: '',
          // CoursesDetailsScreen.subjectNameKey: data.subjectId!,
          CoursesDetailsScreen.teacherIdKey: data.teacherId!
        });
      },
      isSubScribe: true,
      coursesModel: data);
}
// return
