import 'package:flick_video_player/flick_video_player.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_componant.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_info.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_sessions.dart';
import 'package:video_player/video_player.dart';


class GroupsLessonDetailsScreen extends StatefulWidget {
  const GroupsLessonDetailsScreen({super.key});

  @override
  State<GroupsLessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<GroupsLessonDetailsScreen> {
  int selectedIndex = 0;

  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((data) {
    flickManager = FlickManager(
      // autoInitialize: false,
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          'https://www.youtube.com/watch?v=5-PdM1D4Pqo',
        ),
      ),
    );
    // });
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: 'الدرس الاول',
        widget: BlocBuilder<GroupLessonsDetailsCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(
                  message: state.message,
                  onTap: () => context
                      .read<GroupLessonsDetailsCubit>()
                      .getLessons(lessonId: 215));
            } else if (state is LoadedState) {
              return buildDetails(state.data);
            }
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainAppColor,
              ),
            );
          },
        ),
      ),
    );
  }

  buildDetails(GroupLessonDetailsDataModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlickVideoPlayer(flickManager: flickManager),
          20.vs,
          Padding(
            padding: getPadding(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: model.teacherName!,
                  style: getBoldTextStyle(fontSize: 20),
                ),
                10.vs,
                BuildGroupComponent(
                  model: model,
                ),
                10.vs,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomTextWidget(
                    text: model.description!,
                    style: getSemiboldTextStyle(
                        fontSize: 11, color: AppColors.black.withOpacity(0.68)),
                  ),
                ),
                20.vs,
                CustomTabBar(
                    fontSize: 14,
                    // indexItem: index,
                    text: AppListsConstant.lessonsTabBar,
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      selectedIndex = index;

                      setState(() {});
                    }),
                selectedIndex == 0 ? 20.vs : 0.vs,
                selectedIndex == 0
                    ? BuildGroupInfo(model: model,)
                    : BuildGroupSessions(model: model)
              ],
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            onPressed: () {},
            text: AppStrings().subscribeNow.trans,
            margin: getMargin(horizontal: 100.w, bottom: 10.h),
          )
        ],
      );
}
