import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';

class BuildSessionsOfGroup extends StatelessWidget {
  const BuildSessionsOfGroup({super.key, required this.model});
  final List<SessionsOfGroupData> model;
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      axisDirection: Axis.vertical,
      shrinkWrap: true,
      padding: getPadding(top: 30.h, horizontal: 10.w, bottom: 60.h),
      itemCount: model.length,
      // scroll: NeverScrollableScrollPhysics(),
      separatorWidget: (context, index) => 15.vs,
      widget: (context, index) => CustomListTile(
        isDivider: false,
        onTap: () {
          // context.read<SessionsOfGroupCubit>().getLessons(
          //     lessonId: model[index].groupId!);
          // Routes.groupsLessonRoute.moveToWithArgs({
          //   GroupsLessonDetailsScreen.titleKey:
          //   context.read<LanguageCubit>().isEn
          //       ? model.teacherGroups![index].titleEn
          //       : model.teacherGroups![index].title,
          //   GroupsLessonDetailsScreen.isSubscribeKey:
          //   model.teacherGroups![index].isSubscribed
          // });
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
        title: '${AppStrings().session} ${index + 1}',
        subtitle: model[index].title!,
        endSubtitle:
            '${model[index].classAt!.day}/${model[index].classAt!.month}/${model[index].classAt!.year}',
        endTitle: '${model[index].fromTime} ${model[index].toTime!}',
        image: AppAssets().teacher,
      ),
    );
  }
}
