import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/groups_details/presentation/pages/groups_details_screen.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_operation_cubit.dart';
import 'package:teaching/features/private/presentation/widgets/build_private_groups_search.dart';

import '../../../courses_groups/presentation/widgets/build_courses_groubs_tab_bar.dart';
import '../../../teacher/teachers/presentation/widgets/build_teacher_item.dart';
import '../manager/private_groups_cubit.dart';

class PrivateGroupsScreen extends StatefulWidget {
  const PrivateGroupsScreen({super.key});

  @override
  State<PrivateGroupsScreen> createState() => _PrivateGroupsScreenState();
}

class _PrivateGroupsScreenState extends State<PrivateGroupsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PrivateGroupsCubit>().getPrivateGroups();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        title: AppStrings().private.trans,
        anotherWidget: BuildPrivateGroupsSearch(),
        widget: Column(
          children: [
            20.vs,
            CustomSubjectList(
              isPrivateGroups: true,
            ),
            20.vs,
            _buildTabBar,
            Expanded(
              child: _buildTabBarView,
            )
            // BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
            //   builder: (context, state) {
            //     if (context.read<CoursesGroupOperationCubit>().publicTapIndex ==
            //         0) {
            //       return const BuildPublicCoursesTabBarView();
            //     } else {
            //       return const BuildPublicGroupTabBarView();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  get _buildTabBar => BlocBuilder<PrivateGroupsOperationCubit, CubitStates>(
        builder: (context, state) {
          return CustomTabBar(
              onTap: (index) => context
                  .read<PrivateGroupsOperationCubit>()
                  .onChangePrivateGroupsIndex(index),
              text: AppListsConstant.private,
              selectedIndex:
                  context.read<PrivateGroupsOperationCubit>().privateIndex
              // : context.read<CoursesGroupOperationCubit>().tapIndex,
              );
        },
      );

  get _buildTabBarView => BlocBuilder<PrivateGroupsCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return Center(
              child: CustomErrorWidget(
                onTap: () =>
                    context.read<PrivateGroupsCubit>().getPrivateGroups(),
                message: state.message,
              ),
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return CustomListView(
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              padding: getPadding(horizontal: 10.w, vertical: 15.h),
              // shrinkWrap: true,
              separatorWidget: (BuildContext context, int index) => 20.vs,
              widget: (BuildContext context, int index) => state is LoadedState
                  ? BuildTeacherItem(
                      onTap: () {
                        // context.read<GroupLessonsDetailsCubit>().getLessons(
                        //     lessonId: model.teacherGroups![index].groupId!);
                        // Routes.groupsLessonRoute.moveToWithArgs({
                        //   GroupsLessonDetailsScreen.titleKey:
                        //   context.read<LanguageCubit>().isEn
                        //       ? model.teacherGroups![index].titleEn
                        //       : model.teacherGroups![index].title,
                        //   GroupsLessonDetailsScreen.isSubscribeKey:
                        //   model.teacherGroups![index].isSubscribed
                        // });

                        /////////////////////////////
                        AppService()
                            .getBlocData<GroupDetailsCubit>()
                            .getGroupDetails(
                                teacherId: state.data[index].teacherId!);
                        Routes.groupsDetailsRoute.moveToWithArgs({
                          GroupsDetailsScreen.whichScreenKey: "default",
                          // CoursesDetailsScreen.subjectNameKey: data.subjectId!,
                          GroupsDetailsScreen.teacherIdKey:
                              state.data[index].teacherId
                        });
                      },
                      group: state.data[index],
                    )
                  : CustomShimmer.fromRectangle(
                      width: width,
                      height: 90,
                    ));
        },
      );
  // BlocBuilder<PrivateGroupsOperationCubit, CubitStates>(
  //   builder: (context, state) {
  //     if (context.read<PrivateGroupsOperationCubit>().privateIndex == 0) {
  //
  //     } else {
  //       return SizedBox.shrink();
  //     }
  //   },
  // );
}
