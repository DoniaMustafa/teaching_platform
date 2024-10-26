import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/video_operation_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/rate_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_attachments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_comments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_course_video.dart';
import 'package:teaching/features/exam/presentation/widgets/build_exam_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/courses_lesson_details_shimmer.dart';

import '../manager/lessons_details/follow_unfollow_video_cubit.dart';
import '../manager/lessons_details/lessons_details_cubit.dart';
import '../widgets/build_contents_widget.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});
  static const String lessonTitleKey = 'lessonTitleKey';
  static const String courseIdKey = 'courseIdKey';
  static int courseId = 0;
  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  int selectedIndex = 0;
  double rate = 0;

  List<GenericModel> component = [
    GenericModel(
      title: '',
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
  String lessonTitle = 'lessonTitleKey';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      lessonTitle = data![LessonDetailsScreen.lessonTitleKey];
      LessonDetailsScreen.courseId = data[LessonDetailsScreen.courseIdKey];
    }
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: lessonTitle,
        widget: BlocBuilder<LessonsDetailsCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(message: state.message, onTap: () {});
            }
            // else if (state is LoadedState && state.data.isNull) {
            //   return CustomTextWidget(text: 'no data');
            // }

            else if (state is LoadedState) {
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
              BuildCourseVideo(
                  // model: model,
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
                      child: CustomTextWidget(
                        text: context.read<LanguageCubit>().isEn.isTrue
                            ? model.lessonTitle!
                            : model.lessonTitleEn ?? '',
                        style: getBoldTextStyle(fontSize: 15),
                      ),
                    )),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(component.length, (index) {
                          component[0].title = model.rate.toString();
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
                                          videoId: model
                                              .courseVideos![0].courseVideoId);
                              }
                            },
                            child: Column(
                              children: [
                                BlocBuilder<FavoriteUnFavoriteVideoCubit,
                                    CubitStates>(
                                  builder: (context, state) {
                                    return BlocBuilder<RateCubit, CubitStates>(
                                      builder: (context, state) {
                                        return CustomIcon(
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
                                                      ? AppColors.mainAppColor
                                                      : AppColors.grayTextColor
                                                  : AppColors.mainAppColor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    AppListsConstant.tabsBar.length,
                    (index) => GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: CustomTextWidget(
                            text: AppListsConstant.tabsBar[index],
                            style: getBoldTextStyle(
                                fontSize: 16,
                                color: selectedIndex == index
                                    ? AppColors.mainAppColor
                                    : AppColors.black),
                          ),
                        )),
              ),
              20.vs,
              Expanded(
                child: selectedIndex == 0
                    ? BuildContentsWidget(
                        lessonModel: model, videoModel: model.courseVideos!)
                    : selectedIndex == 1
                        ? BuildCommentsWidget(
                            videoModel: model.courseVideos!,
                          )
                        : selectedIndex == 2
                            ? BuildAttachmentsWidget(
                                model: model,
                              )
                            : const BuildExamWidget(),
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
