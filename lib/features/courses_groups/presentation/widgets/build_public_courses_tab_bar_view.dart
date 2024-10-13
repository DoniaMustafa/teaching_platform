import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';

class BuildPublicCoursesTabBarView extends StatelessWidget {
  const BuildPublicCoursesTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CoursesCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<CoursesCubit>().getCourser(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return buildTabBarView(state);
        },
      ),
    );
  }

  Widget buildTabBarView(CubitStates state) =>
      BlocBuilder<CoursesCubit, CubitStates>(
        builder: (context, state) {
          return GridView.count(
            crossAxisCount: 2,
            padding: getPadding(horizontal: 10.w, vertical: 20.h),
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
                  return CustomItem(
                      onTap: () {
                        context.read<CoursesDetailsCubit>().getCoursesDetails(
                            TeacherModel(
                                subjectId: state.data[index].subjectId!,
                                teacherId: state.data[index].teacherId!));
                        Routes.coursesDetailsRoute.moveTo;
                      },
                      // isSubScribe: true,
                      coursesModel: state.data[index]);
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
      );
}
