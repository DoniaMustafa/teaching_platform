import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/pages/courses_lesson_details_screen.dart';

class BuildListOfLessons extends StatelessWidget {
  const BuildListOfLessons({super.key, required this.model});
  final TeacherModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomListView(
        axisDirection: Axis.vertical,
        shrinkWrap: true,
        padding: getPadding(vertical: 30.h, horizontal: 10.w),
        itemCount: model.teacherCourses!.length,
        // scroll: NeverScrollableScrollPhysics(),
        separatorWidget: (context, index) => 20.vs,
        widget: (context, index) => CustomExpansionDropDown(
            onSubscribeCourse: () {
              _buildDialog(
                  price:
                      '${model.teacherCourses![index].totalLessonsPrice != 0.0 ? model.teacherCourses![index].totalLessonsPrice!.toDouble() : model.teacherCourses![index].price!.toDouble()} ${model.teacherCourses![index].currency!.contains("جنيه مصرى").isTrue ? AppStrings().egp.trans : ''}',
                  context: context,
                  index: index,
                  courseId: model.teacherCourses![index].courseId!);

              // AppService().getBlocData<SubscribeCourseCubit>().
            },
            onSubscribeLesson: (int id, int lessonsIndex) {
              _buildDialog(
                price:
                    '${model.teacherCourses![index].courseLessons![lessonsIndex].price!} ${model.teacherCourses![index].courseLessons![lessonsIndex].currency!.contains("جنيه مصرى").isTrue ? AppStrings().egp.trans : ''}',
                context: context,
                index: index,
                courseId: model.teacherCourses![index].courseId!,
                courseLessonId: id,
                isCourse: false,
              );
              // AppService().getBlocData<SubscribeCourseCubit>().
            },
            currency: model.teacherCourses![index].currency!
                    .contains("جنيه مصرى")
                    .isTrue
                ? AppStrings().egp.trans
                : '',
            discount: model.teacherCourses![index].totalLessonsPrice.toString(),
            subTitle:
                '${model.teacherCourses![index].lessonsCount!.toString()} '
                '${model.teacherCourses![index].lessonsCount! > 1 ? AppStrings().lessons.trans : AppStrings().lesson.trans}',
            asset:'${EndPoints.url}${model.teacherCourses![index].courseImage}' ,
            titleStyle: getBoldTextStyle(
              fontSize: 16,
            ),
            borderColor: AppColors.transparent,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ],
            price: model.teacherCourses![index].price.toString(),
            isSubscribed: model.teacherCourses![index].isSubscribed,
            items: model.teacherCourses![index].courseLessons!,
            // isFree: false,
            onSelected: (int id, i) {
              context.read<LessonsDetailsCubit>().getLessons(lessonId: id);
              context.read<ExamCubit>().getExams(
                  model: ExamParamsModel(
                      courseId: model.teacherCourses![index].courseId,
                      courseLessonId: id));
              context.read<VideoOperationCubit>().selectedIndex=0;
              model.teacherCourses![index].courseLessons![i].isSubscribed.isTrue
                  ? Routes.lessonDetailsRoute.moveToWithArgs({
                      LessonDetailsScreen.courseIdKey:
                          model.teacherCourses![index].courseId,
                      LessonDetailsScreen.courseTitleKey:
                          context.read<LanguageCubit>().isEn.isTrue
                              ? model.teacherCourses![index].titleEn
                              : model.teacherCourses![index].title,
                      LessonDetailsScreen.lessonTitleKey:
                          context.read<LanguageCubit>().isEn.isTrue
                              ? model.teacherCourses![index].courseLessons![i]
                                      .lessonTitleEn ??
                                  ''
                              : model.teacherCourses![index].courseLessons![i]
                                      .lessonTitle ??
                                  ''
                    })
                  : model.teacherCourses![index].courseLessons![i].isSubscribed
                              .isFalse &&
                          model.teacherCourses![index].courseLessons![i].free
                              .isTrue
                      ? Routes.lessonDetailsRoute.moveToWithArgs({
                          LessonDetailsScreen.courseIdKey:
                              model.teacherCourses![index].courseId,
                          LessonDetailsScreen.courseTitleKey:
                              context.read<LanguageCubit>().isEn.isTrue
                                  ? model.teacherCourses![index].titleEn ?? ""
                                  : model.teacherCourses![index].title ?? "",
                          LessonDetailsScreen.lessonTitleKey:
                              context.read<LanguageCubit>().isEn.isTrue
                                  ? model.teacherCourses![index]
                                          .courseLessons![i].lessonTitleEn ??
                                      ""
                                  : model.teacherCourses![index]
                                          .courseLessons![i].lessonTitle ??
                                      ""
                        })
                      : null;

              // selectedCountryId = id;
              // context.read<EducationCubit>().getEducationPrograms(id: id);
            },
            lesson: model.teacherCourses![index].courseLessons!,
            unselectedColor: AppColors.white,
            title: context.read<LanguageCubit>().isEn.isTrue
                ? model.teacherCourses![index].titleEn!
                : model.teacherCourses![index].title!,
            status: ListStatus.listLoaded),
      ),
    );
  }

  void _buildDialog(
      {required context,
      required String price,
      required int index,
      required int courseId,
      int? courseLessonId,
      bool isCourse = true}) {
    showCustomDialog(
        height: 230.h,
        context: context,
        style: getRegularTextStyle(
          fontSize: 16,
          color: AppColors.black.withOpacity(0.67),
        ),
        title:
            "${AppStrings().discount.trans} $price ${AppStrings().fromWallet.trans} ${AppService().getBlocData<LanguageCubit>().isEn.isTrue ? model.teacherCourses![index].titleEn : model.teacherCourses![index].title} ",
        widget: Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                2,
                (index) => Expanded(
                        child: BlocBuilder<SubscribeCourseCubit, CubitStates>(
                      builder: (context, state) {
                        return CustomElevatedButton(
                            margin: getMargin(horizontal: 10.w),
                            onPressed: () {
                              print(
                                  'courseId>>>>>>>>>>>>>>>>>>>> ${model.teacherCourses![index].courseId}');
                              switch (index) {
                                case 0:
                                  if (isCourse) {
                                    context
                                        .read<SubscribeCourseCubit>()
                                        .addSubscribeCourseOrLesson(
                                            teacherId:
                                                CoursesDetailsScreen.teacherId,
                                            teacherCourse: TeacherCourse(
                                                courseId: courseId));
                                    context
                                        .read<CoursesGroupOperationCubit>()
                                        .selectedIndex = null;
                                  } else {
                                    context
                                        .read<CoursesGroupOperationCubit>()
                                        .selectedIndex = null;
                                    context
                                        .read<SubscribeCourseCubit>()
                                        .addSubscribeCourseOrLesson(
                                            teacherId:
                                                CoursesDetailsScreen.teacherId,
                                            teacherCourse: TeacherCourse(
                                                courseLessonId: courseLessonId,
                                                courseId: courseId));
                                  }
                                case 1:
                                  pop();
                              }
                            },
                            text: index == 0
                                ? AppStrings().done.trans
                                : AppStrings().cancel.trans);
                      },
                    ))),
          ),
        ));
  }
}
