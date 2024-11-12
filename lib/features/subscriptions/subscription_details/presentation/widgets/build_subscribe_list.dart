import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/pages/courses_lesson_details_screen.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/manager/subscriptipn_course_details_cubit.dart';

class BuildSubscribeList extends StatelessWidget {
  const BuildSubscribeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SubscriptionCourseDetailsCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(message: state.message, onTap: () {});
          } else if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return CustomListView(
              padding: getPadding(vertical: 20.h),
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              shrinkWrap: true,
              axisDirection: Axis.vertical,
              scroll: const BouncingScrollPhysics(),
              separatorWidget: (context, index) => 15.vs,
              widget: (context, index) => state is LoadedState
                  ? _buildItem(state.data[0], index)
                  : CustomShimmer(
                      height: 100.h,
                      width: width,
                    ));
        },
      ),
    );
  }

  Widget _buildItem(TeacherModel model, int courseIndex) =>
      CustomExpansionDropDown(
        onSelected: (int id, int index) {
          AppService()
              .getBlocData<LessonsDetailsCubit>()
              .getLessons(lessonId: id);
          AppService().getBlocData<ExamCubit>().getExams(
              model: ExamParamsModel(
                  courseId: model.teacherCourses![courseIndex].courseId,
                  courseLessonId: id));

          Routes.lessonDetailsRoute.moveToWithArgs({
            LessonDetailsScreen.courseIdKey:
                model.teacherCourses![courseIndex].courseId,
            LessonDetailsScreen.courseTitleKey:
                AppService().getBlocData<LanguageCubit>().isEn.isTrue
                    ? model.teacherCourses![courseIndex].titleEn
                    : model.teacherCourses![courseIndex].title,
            LessonDetailsScreen.lessonTitleKey:
                AppService().getBlocData<LanguageCubit>().isEn.isTrue
                    ? model.teacherCourses![courseIndex].courseLessons![index]
                            .lessonTitleEn ??
                        ''
                    : model.teacherCourses![courseIndex].courseLessons![index]
                            .lessonTitle ??
                        ''
          });
        },
        color: AppColors.white,
        borderColor: AppColors.transparent,
        asset: AppAssets().professionalCourses,
        items: model.teacherCourses![courseIndex].courseLessons!,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 4)
        ],
        isSubscribed: true,
        subTitle:
            '${model.teacherCourses![courseIndex].lessonsCount} ${model.teacherCourses![courseIndex].lessonsCount! < 2 ? AppStrings().lesson : AppStrings().lessons}',
        title: AppService().getBlocData<LanguageCubit>().isEn
            ? model.teacherCourses![courseIndex].titleEn!
            : model.teacherCourses![courseIndex].title!,
        status: ListStatus.listLoaded,
        lesson: model.teacherCourses![courseIndex].courseLessons,
      );
}
