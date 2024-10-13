import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_attachments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_comments_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_exam_widget.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/courses_lesson_details_shimmer.dart';
import 'package:video_player/video_player.dart';

import '../manager/lessons_details/lessons_details_cubit.dart';
import '../widgets/build_contents_widget.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({super.key});

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  int selectedIndex = 0;
  List<String> tabsBar = [
    'المحتويات',
    'التعليقات',
    'المرفقات',
    'الامتحانات',
  ];
  List<GenericModel> component = [
    GenericModel(
      title: '(10)',
      image: AppAssets().star,
    ),
    GenericModel(
      title: 'اسأل',
      image: AppAssets().ask,
    ),
    GenericModel(
      title: 'حفظ',
      image: AppAssets().favorite,
    )
  ];
  List<Widget> tabsWidgets = [];
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((data) {
      //  videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      //     '${EndPoints.url}'
      //           '${context.read<LessonsDetailsCubit>().lessonData!.firstLessonVideoUrl!}'));
      //
      //  videoPlayerController.initialize();
      //
      // chewieController  = ChewieController(
      //   videoPlayerController: videoPlayerController,
      //   autoPlay: true,
      //   looping: true,
      // );

      // final playerWidget = ;

      flickManager = FlickManager(
        // autoInitialize: false,
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            '${EndPoints.url}'
            '${context.read<LessonsDetailsCubit>().lessonData!.firstLessonVideoUrl!}')),
      );
    });
  }

  @override
  void dispose() {
    flickManager.dispose();
    // chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: 'الدرس الاول',
        widget: BlocBuilder<LessonsDetailsCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(
                  message: state.message,
                  onTap: () => context
                      .read<LessonsDetailsCubit>()
                      .getLessons(lessonId: 215));
              } else if (state is LoadedState) {
                return buildDetails(state.data);
            }
            return const CoursesLessonDetailsShimmer();
          },
        ),
      ),
    );
  }

  buildDetails(CourseLessonDataMode model) => Column(
        children: [
          // Chewie(
          //   controller: chewieController,
          // ),
          FlickVideoPlayer(flickManager: flickManager),
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
                    text: model.subjectName ?? '',
                    style: getBoldTextStyle(fontSize: 15),
                  ),
                )),
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        component.length,
                        (index) => Column(
                              children: [
                                CustomSvg(asset: component[index].image!),
                                5.vs,
                                CustomTextWidget(text: component[index].title!)
                              ],
                            )),
                  ),
                )
              ],
            ),
          ),
          30.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                tabsBar.length,
                (index) => GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: CustomTextWidget(
                        text: tabsBar[index],
                        style: getBoldTextStyle(
                            fontSize: 16,
                            color: selectedIndex == index
                                ? AppColors.mainAppColor
                                : AppColors.black),
                      ),
                    )),
          ),
          Expanded(
            child: selectedIndex == 0
                ? BuildContentsWidget(videoModel: model.courseVideos!)
                : selectedIndex == 1
                    ? BuildCommentsWidget()
                    : selectedIndex == 2
                        ? BuildAttachmentsWidget()
                        : BuildExamWidget(),
          ),
        ],
      );
}
