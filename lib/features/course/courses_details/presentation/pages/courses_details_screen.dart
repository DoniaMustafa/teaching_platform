import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/build_courses_component.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/build_list_of_lessons.dart';
import 'package:teaching/features/course/courses_details/presentation/widgets/courses_detauls_shimmer.dart';

class CoursesDetailsScreen extends StatelessWidget {
  CoursesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        .getCoursesDetails(2));
              }
              if (state is LoadedState) {
                return buildCoursesDetails(state.data[0]);
              }
              return CoursesDetailsShimmer();
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
          BuildListOfLessons(
            model: model,
          ),
        ],
      );
}
