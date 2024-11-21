import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/build_video_view.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/widgets/courses_lesson_details_shimmer.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/build_exam_widget.dart';
import 'package:teaching/features/home_work/presentation/widgets/build_tab_bar_And_tab_view.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/exam_video_of_session_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_details_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/widgets/build_additional_video_component.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/widgets/build_session_comments_widget.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/widgets/build_video_tabs_bar.dart';
import '../../data/models/video_of_session_details_response_model.dart';
import '../manager/lessons_details/video_data_cubit.dart';
import '../widgets/build_session_contents_widget.dart';
import '../widgets/build_session_attachments_widget.dart';

class VideoOfSessionScreen extends StatefulWidget {
  const VideoOfSessionScreen({super.key});
  // static const String sessionTitleKey = 'sessionTitleKey';
  static const String groupIdKey = 'groupIdKey';

  static const String groupTitleKey = 'groupTitleKey';
  static int groupId = 0;
  @override
  State<VideoOfSessionScreen> createState() => _VideoOfSessionScreenState();
}

class _VideoOfSessionScreenState extends State<VideoOfSessionScreen> {
  List<Widget> tabsWidgets = [];
  String sessionTitle = 'sessionTitle';
  String groupTitle = 'groupTitle';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      VideoOfSessionScreen.groupId = data![VideoOfSessionScreen.groupIdKey];
      groupTitle = data[VideoOfSessionScreen.groupTitleKey];
      // VideoOfSessionScreen.courseId = data[VideoOfSessionScreen.courseIdKey];
    }
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: groupTitle,
        widget: BlocBuilder<VideoOfSessionDetailsCubit, CubitStates>(
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

  buildDetails(VideoSessionsData model) =>
      BlocBuilder<VideoOfSessionOperationCubit, CubitStates>(
        builder: (context, state) {
          return Column(
            children: [
              BuildVideoView(
                whichScreen: AppStrings().group,
              ),
              10.vs,
              _buildVideoTitle(model),
              30.vs,
              BuildVideoTabsBar(),
              // 20.vs,
              Expanded(child: BlocBuilder<TabBarOperationCubit, CubitStates>(
                  builder: (context, state) {
                return context.read<TabBarOperationCubit>().tapIndex == 0
                    ? const BuildSessionContentsWidget()
                    : context.read<TabBarOperationCubit>().tapIndex == 1
                        ? BlocBuilder<VideoDataCubit, CubitStates>(
                            builder: (context, state) {
                              return BuildSessionCommentsWidget();
                            },
                          )
                        : context.read<TabBarOperationCubit>().tapIndex == 2
                            ? BlocBuilder<VideoDataCubit, CubitStates>(
                                builder: (context, state) {
                                  return BuildSessionAttachmentsWidget(
                                    attachments: context
                                        .read<VideoDataCubit>()
                                        .attachment,
                                  );
                                },
                              )
                            : context.read<TabBarOperationCubit>().tapIndex == 3
                                ? const BuildExamWidget()
                                : Column(
                                    children: [
                                      10.vs,
                                      const Expanded(
                                          child: BuildTabBarAndTabView()),
                                    ],
                                  );
              })),
            ],
          );
        },
      );

  Widget _buildVideoTitle(VideoSessionsData model) => Padding(
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
                      text: sessionTitle,
                      style: getBoldTextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            BuildAdditionalVideoComponent(
              model: model,
            )
          ],
        ),
      );
}
