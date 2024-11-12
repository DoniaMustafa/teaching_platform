import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_attachments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_comments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_video_view.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/courses_lesson_details_shimmer.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/build_exam_widget.dart';

import '../widgets/build_contents_widget.dart';

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
  double rate = 0;

  List<GenericModel> component = [
    GenericModel(
      title: AppStrings().rate.trans,
      icon: Icons.star,
    ),
    GenericModel(
      title: AppStrings().ask.trans,
      icon: Icons.announcement_sharp,
    ),
    GenericModel(
      title: AppStrings().save.trans,
      icon: Icons.bookmark,
    ),
  ];
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
              Padding(
                padding: getPadding(horizontal: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: getPadding(start: 10.w, top: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: lessonTitle,
                              style: getBoldTextStyle(fontSize: 15),
                            ),
                            CustomTextWidget(
                              text: AppService()
                                  .getBlocData<VideoOperationCubit>()
                                  .videoTitle!,
                              style: getRegularTextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(component.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  _showRateDialog(
                                      context, model.courseVideos![0]);
                                  // isRate = !isRate;

                                  setState(() {});
                                case 2:
                                  context
                                      .read<FavoriteUnFavoriteVideoCubit>()
                                      .addFavoriteUnFavoriteVideo(
                                          videoId: context
                                                  .read<VideoOperationCubit>()
                                                  .videoId ??
                                              model.courseVideos![0]
                                                  .courseVideoId);
                              }
                            },
                            child: Column(
                              children: [
                                BlocBuilder<FavoriteUnFavoriteVideoCubit,
                                    CubitStates>(
                                  builder: (context, state) {
                                    return BlocBuilder<RateCubit, CubitStates>(
                                      builder: (context, state) {
                                        return Row(
                                          children: [
                                            if (index == 0)
                                              CustomTextWidget(
                                                text:
                                                    '(${model.rate.toString()})',
                                                style: getRegularTextStyle(
                                                    fontSize: 12),
                                              ),
                                            CustomIcon(
                                              icon: component[index].icon!,
                                              color: index == 0
                                                  ? context
                                                          .read<RateCubit>()
                                                          .isRate
                                                          .isTrue
                                                      ? AppColors.yellow
                                                      : AppColors.textGrayColor1
                                                  : index == 2
                                                      ? context
                                                              .read<
                                                                  FavoriteUnFavoriteVideoCubit>()
                                                              .isFavorite
                                                              .isTrue
                                                          ? AppColors
                                                              .mainAppColor
                                                          : AppColors
                                                              .grayTextColor
                                                      : AppColors.mainAppColor,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                5.vs,
                                CustomTextWidget(text: component[index].title!)
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              30.vs,
              Expanded(
                child: BlocBuilder<VideoOperationCubit, CubitStates>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              AppListsConstant.tabsBar.length,
                              (index) => GestureDetector(
                                    onTap: () => context.read<VideoOperationCubit>().onChangeTabBar(index),
                                    child: CustomTextWidget(
                                      text: AppListsConstant.tabsBar[index],
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
                        Expanded(
                            child:
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
                                            : const BuildExamWidget()),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      );

  void _showRateDialog(context, CourseVideoModel model) {
    showCustomDialog(
        height: 340.h,
        context: context,
        style: getSemiboldTextStyle(
          fontSize: 18,
          color: AppColors.darkMainAppColor,
        ),
        title: AppStrings().rateNow.trans,
        widget: Expanded(
          child: Column(
            children: [
              // CustomTextWidget(
              //   text:
              //   '${AppStrings().ratesCount.trans} : ${model.reviewersCount}',
              //   style: getMediumTextStyle(
              //     fontSize: 16,
              //   ),
              // ),
              20.vs,
              BuildRatingBar(
                itemCount: 5,
                itemSize: 35,
                rate: rate,
                onRate: (rating) {
                  rate = rating;
                },
              ),
              20.vs,
              CustomElevatedButton(
                  margin: getMargin(horizontal: 20.w),
                  onPressed: () => AppService()
                      .getBlocData<RateCubit>()
                      .addVideoRate(
                          rate: rate.toInt(), videoId: model.courseVideoId),
                  text: AppStrings().done.trans)
            ],
          ),
        ));
  }
}
