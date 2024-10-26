// import 'package:pod_player/pod_player.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/subscription_group_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_componant.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_info.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_sessions.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/widgets/build_group_video.dart';

class GroupsLessonDetailsScreen extends StatefulWidget {
  const GroupsLessonDetailsScreen({super.key});
  static const String isSubscribeKey = "isSubscribeKey";
  static const String titleKey = "titleKey";
  static bool isSubscribe = false;
  @override
  State<GroupsLessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<GroupsLessonDetailsScreen> {
  int selectedIndex = 0;
  // late VideoPlayerController _videoPlayerController;
  // late FlickManager flickManager;

  String title = '';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = getArguments(context)!;
    if (data.isNotNull) {
      title = data[GroupsLessonDetailsScreen.titleKey];
      GroupsLessonDetailsScreen.isSubscribe =
          data[GroupsLessonDetailsScreen.isSubscribeKey];
    }
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: title,
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

  buildDetails(GroupLessonDetailsDataModel model) => SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildGroupVideo(
              model: model,
            ),
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
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.68)),
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
                      ? BuildGroupInfo(
                          model: model,
                        )
                      : BuildGroupSessions(model: model)
                ],
              ),
            ),
            selectedIndex == 0 ? 110.vs : 10.vs,
            GroupsLessonDetailsScreen.isSubscribe.isTrue
                ? BlocBuilder<SubscriptionGroupCubit, CubitStates>(
                    builder: (context, state) {
                      if (context
                          .read<SubscriptionGroupCubit>()
                          .isSubscribed
                          .isFalse) {
                        return CustomElevatedButton(
                          onPressed: () => context
                              .read<SubscriptionGroupCubit>()
                              .subscriptionGroup(model.groupId!),
                          text: AppStrings().subscribeNow.trans,
                          margin: getMargin(horizontal: 100.w, bottom: 10.h),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
}
