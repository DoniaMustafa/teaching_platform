import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_subject.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/build_group_details_component.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/group_details_shimmer.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_subscribe_list.dart';

class GroupsDetailsScreen extends StatelessWidget {
  GroupsDetailsScreen({super.key});
  static const String whichScreenKey = 'whichScreenKey';
  String whichScreen = '';
  static const String teacherIdKey = 'teacherIdKey';
  static String teacherId = '';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);

    if (data.isNotNull) {
      whichScreen = data![whichScreenKey] ?? 'default';
    }
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().groupDetails.trans,
          widget: BlocBuilder<GroupDetailsCubit, CubitStates>(
            builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(
                    message: state.message,
                    onTap: () => context
                        .read<GroupDetailsCubit>()
                        .getGroupDetails(teacherId: 94));
              } else if (state is LoadedState && state.data.isEmpty) {
                return CustomEmptyWidget();
              } else if (state is LoadedState) {
                return buildDetails(state.data[0]);
              }
              return const GroupDetailsShimmer();
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
// 10.vs,
          if (whichScreen == AppStrings().teacherDetails)
            CustomSubjectList(
              // teacherId: model,
              isCourse: false,
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
