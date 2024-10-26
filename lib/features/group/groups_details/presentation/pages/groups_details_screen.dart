import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_subject.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/pages/groups_lesson_details_screen.dart';
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

  buildDetails(GroupDetailsDataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _buildBody(model),
          CustomElevatedButton(
              width: 200.w,
              onPressed: () => Routes.bookingDateRoute.moveTo,
              text: AppStrings().bookDate.trans),
        ],
      );

  Widget _buildBody(GroupDetailsDataModel model) => Column(
        children: [
          20.vs,
          BuildGroupDetailsHeaderComponent(
            model: model,
          ),
          if (whichScreen == AppStrings().teacherDetails)
            CustomSubjectList(
              // teacherId: model,
              isCourse: false,
            ),
          Expanded(
            child: CustomListView(
              axisDirection: Axis.vertical,
              shrinkWrap: true,
              padding: getPadding(top: 30.h, horizontal: 10.w, bottom: 60.h),
              itemCount: model.teacherGroups!.length,
              // scroll: NeverScrollableScrollPhysics(),
              separatorWidget: (context, index) => 15.vs,
              widget: (context, index) => CustomListTile(
                isDivider: false,
                onTap: () {
                  context.read<GroupLessonsDetailsCubit>().getLessons(
                      lessonId: model.teacherGroups![index].groupId!);
                  Routes.groupsLessonRoute.moveToWithArgs({
                    GroupsLessonDetailsScreen.titleKey:
                        context.read<LanguageCubit>().isEn
                            ? model.teacherGroups![index].titleEn
                            : model.teacherGroups![index].title,
                    GroupsLessonDetailsScreen.isSubscribeKey:
                        model.teacherGroups![index].isSubscribed
                  });
                },
                padding: getPadding(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                      color: AppColors.black.withOpacity(0.25))
                ],
                title: context.read<LanguageCubit>().isEn
                    ? model.teacherGroups![index].titleEn!
                    : model.teacherGroups![index].title!,
                subtitle:
                    '${model.teacherGroups![index].availablePlaces}/${model.teacherGroups![index].limit} ${AppStrings().student.trans}',
                endSubtitle:
                    '${model.teacherGroups![index].sessionsCount} ${AppStrings().session.trans} ',
                endTitle:
                    '${model.teacherGroups![index].price.toString()} ${model.teacherGroups![index].currencyName!.contains('جنية مصري').isTrue ? AppStrings().egp.trans : ''}',
                image: AppAssets().teacher,
              ),
            ),
          ),
        ],
      );
}
