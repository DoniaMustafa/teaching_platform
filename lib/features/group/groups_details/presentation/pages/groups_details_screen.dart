import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/build_group_details_component.dart';

class GroupsDetailsScreen extends StatelessWidget {
  GroupsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().coursesAndGroups.trans,
          widget: BlocBuilder<GroupDetailsCubit, CubitStates>(
            builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(
                    message: state.message,
                    onTap: () => context
                        .read<GroupDetailsCubit>()
                        .getGroupDetails(teacherId: 94));
              } else if (state is LoadedState) {
                return buildDetails(state.data[0]);
              }
              return CircularProgressIndicator(
                color: AppColors.mainAppColor,
              );
            },
          ),
        ));
  }

  buildDetails(GroupDetailsDataModel model) => Column(
        children: [
          20.vs,
          BuildGroupDetailsHeaderComponent(
            model: model,
          ),
          Expanded(
            child: CustomListView(
              axisDirection: Axis.vertical,
              shrinkWrap: true,
              padding: getPadding(vertical: 30.h, horizontal: 10.w),
              itemCount: model.teacherGroups!.length,
              // scroll: NeverScrollableScrollPhysics(),
              separatorWidget: (context, index) => 20.vs,
              widget: (context, index) => CustomListTile(
                onTap: () {
                  context.read<GroupLessonsDetailsCubit>().getLessons(
                      lessonId: model.teacherGroups![index].groupId!);

                  Routes.groupsLessonRoute.moveTo;
                },
                padding: getPadding(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 3,
                      color: AppColors.black.withOpacity(0.20))
                ],
                title: model.teacherGroups![index].title!,
                subtitle:
                    '${model.teacherGroups![index].availablePlaces}/${model.teacherGroups![index].limit}طالب',
                endSubtitle:
                    '${model.teacherGroups![index].sessionsCount} حصة ',
                endTitle: model.teacherGroups![index].price.toString(),
                image: AppAssets().teacher,
              ),
            ),
          ),
        ],
      );
}
