import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/build_group_details_component.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/group_details_shimmer.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/exam_video_of_session_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_details_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/pages/video_of_session_screen.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_cubit.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_operation_cubit.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/widgets/build_session_item_shimmer.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/widgets/build_sessions_of_group.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/widgets/build_sessions_tab_bar.dart';

class StudentGroupSessionsScreen extends StatelessWidget {
  StudentGroupSessionsScreen({super.key});
  static const String groupDetailsKey = 'groupDetailsKey';
  static const String groupIdKey = 'groupIdKey';
  static GroupDetailsDataModel? model;
  static int? groupId;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      model = data![StudentGroupSessionsScreen.groupDetailsKey];
      groupId = data[StudentGroupSessionsScreen.groupIdKey];
      print('groupId??? $groupId');
    }
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().groupDetails.trans,
          widget: Column(
            children: [
              20.vs,
              BuildGroupDetailsHeaderComponent(
                model: model!,
              ),
              20.vs,
              const BuildSessionsTabBar(),
              Expanded(
                child: BlocBuilder<SessionsOfGroupCubit, CubitStates>(
                  builder: (context, state) {
                    if (state is FailedState) {
                      return CustomErrorWidget(
                          message: state.message,
                          onTap: () {
                            // context
                            //   .read<GroupDetailsCubit>()
                            //   .getGroupDetails(teacherId: 94);
                          });
                    } else if (state is LoadedState &&
                        (context
                                    .read<SessionsOfGroupOperationCubit>()
                                    .sessionsIndex ==
                                0
                            ? context
                                .read<SessionsOfGroupCubit>()
                                .previousVideos
                                .isEmpty
                            : context
                                .read<SessionsOfGroupCubit>()
                                .nextVideos
                                .isEmpty)) {
                      return CustomEmptyWidget();
                    }
                    return CustomListView(
                        shrinkWrap: true,
                        padding: getPadding(
                            top: 30.h, horizontal: 10.w, bottom: 60.h),
                        itemCount: state is LoadedState
                            ? context
                                        .read<SessionsOfGroupOperationCubit>()
                                        .sessionsIndex ==
                                    0
                                ? context
                                    .read<SessionsOfGroupCubit>()
                                    .previousVideos
                                    .length
                                : context
                                    .read<SessionsOfGroupCubit>()
                                    .nextVideos
                                    .length
                            : AppConstants.shimmerItems,
                        separatorWidget: (context, index) => 15.vs,
                        widget: (context, index) {
                          if (state is LoadedState) {
                            return BlocBuilder<SessionsOfGroupOperationCubit,
                                CubitStates>(
                              builder: (context, state) {
                                if (context
                                            .read<
                                                SessionsOfGroupOperationCubit>()
                                            .sessionsIndex ==
                                        0 &&
                                    context
                                        .read<SessionsOfGroupCubit>()
                                        .previousVideos
                                        .isNotEmpty) {
                                  return BuildSessionsOfGroup(
                                    onTap: () {
                                      print(StudentGroupSessionsScreen.groupId);
                                      context
                                          .read<VideoOfSessionDetailsCubit>()
                                          .getSessionsVideo(
                                            sessionsVideoId: context
                                                .read<SessionsOfGroupCubit>()
                                                .previousVideos[index]
                                                .id!,
                                            groupId: StudentGroupSessionsScreen
                                                .groupId!,
                                          );
                                      AppService()
                                          .getBlocData<HomeworkOperationCubit>()
                                          .tapIndex = 0;
                                      context
                                          .read<ExamOperationCubit>()
                                          .examTapIndex = 0;
                                      context
                                          .read<TabBarOperationCubit>()
                                          .tapIndex = 0;
                                      Routes.videoOfSessionRoute
                                          .moveToWithArgs({
                                        VideoOfSessionScreen.groupTitleKey:
                                            context
                                                .read<SessionsOfGroupCubit>()
                                                .previousVideos[index]
                                                .title,
                                        VideoOfSessionScreen.groupIdKey: context
                                            .read<SessionsOfGroupCubit>()
                                            .previousVideos[index]
                                            .id,
                                      });
                                    },
                                    model: context
                                        .read<SessionsOfGroupCubit>()
                                        .previousVideos,
                                    index: index,
                                  );
                                }
                                if (context
                                            .read<
                                                SessionsOfGroupOperationCubit>()
                                            .sessionsIndex ==
                                        1 &&
                                    context
                                        .read<SessionsOfGroupCubit>()
                                        .nextVideos
                                        .isNotEmpty) {
                                  return BuildSessionsOfGroup(
                                    onTap: () {},
                                    model: context
                                        .read<SessionsOfGroupCubit>()
                                        .nextVideos,
                                    index: index,
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            );
                          } else {
                            return const BuildSessionItemShimmer();
                          }
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
