import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_attachments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_comments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_video_view.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/courses_lesson_details_shimmer.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/build_exam_widget.dart';

import '../widgets/build_contents_widget.dart';
import '../widgets/build_video_additional_component.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});
  static const String lessonTitleKey = 'lessonTitleKey';
  static const String courseIdKey = 'courseIdKey';
  static const String courseTitleKey = 'courseTitleKey';
  static int courseId = 0;
  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  int selectedIndex = 0;

  List<Widget> tabsWidgets = [];
  String lessonTitle = 'lessonTitle';
  String courseTitle = 'courseTitle';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      lessonTitle = data![LessonDetailsScreen.lessonTitleKey];
      courseTitle = data[LessonDetailsScreen.courseTitleKey];
      LessonDetailsScreen.courseId = data[LessonDetailsScreen.courseIdKey];
    }
    // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${LessonDetailsScreen.courseId}');
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: courseTitle,
        widget: BlocBuilder<LessonsDetailsCubit, LessonsDetailsState>(
          builder: (context, state) {
            if (state is LessonsDetailsErrorState) {
              return CustomErrorWidget(message: state.message, onTap: () {});
            }
            // else if (state is LoadedState && state.data.isNull) {
            //   return CustomTextWidget(text: 'no data');
            // }

            else if (state is LessonsDetailsLoadedState) {
              return buildDetails(state.data);
            }
            return const CoursesLessonDetailsShimmer();
          },
        ),
      ),
    );
  }

  buildDetails(CourseLessonDataMode model) =>
      BlocBuilder<VideoOperationCubit, CubitStates>(
        builder: (context, state) {
          return Column(
            children: [
              BuildVideoView(
                whichScreen: AppStrings().course,
              ),
              10.vs,
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      BuildVideoAdditionalComponent(
                        model: model,
                        lessonTitle: lessonTitle,
                      ),
                      30.vs,
                      SizedBox(
                        child: BlocBuilder<VideoOperationCubit, CubitStates>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: List.generate(
                                      AppListsConstant.tabsBar.length,
                                      (index) => GestureDetector(
                                            onTap: () => context
                                                .read<VideoOperationCubit>()
                                                .onChangeTabBar(index),
                                            child: CustomTextWidget(
                                              text: AppListsConstant
                                                  .tabsBar[index],
                                              style: getBoldTextStyle(
                                                  fontSize: 16,
                                                  color: context
                                                              .read<
                                                                  VideoOperationCubit>()
                                                              .tabIndex ==
                                                          index
                                                      ? AppColors.mainAppColor
                                                      : AppColors.black),
                                            ),
                                          )),
                                ),
                                20.vs,
                                context.read<VideoOperationCubit>().tabIndex ==
                                        0
                                    ? BuildContentsWidget(
                                        lessonModel: model,
                                        videoModel: model.courseVideos!)
                                    : context
                                                .read<VideoOperationCubit>()
                                                .tabIndex ==
                                            1
                                        ? BuildCommentsWidget(
                                            videoModel: model.courseVideos!,
                                          )
                                        : context
                                                    .read<VideoOperationCubit>()
                                                    .tabIndex ==
                                                2
                                            ? BuildAttachmentsWidget(
                                                model: model,
                                              )
                                            : const BuildExamWidget(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      );
}
