import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/pages/groups_details_screen.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';

class BuildPublicGroupTabBarView extends StatelessWidget {
  const BuildPublicGroupTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PublicGroupCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<PublicGroupCubit>().getPublicGroups(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return GridView.count(
            crossAxisCount: 2,
            padding: getPadding(horizontal: 10.w, top: 40.h, bottom: 20.h),
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 20.w,
            shrinkWrap: true,
            childAspectRatio: 0.5 / 0.6,
            children: List.generate(
              state is LoadedState
                  ? state.data.length
                  : AppConstants.nShimmerItems,
              (index) {
                if (state is LoadedState) {
                  return buildTeachersItem(state.data[index]);
                } else {
                  return CustomShimmer.fromRectangle(
                    borderRadius: BorderRadiusDirectional.circular(10.r),
                    height: 150.h,
                    width: 200,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildTeachersItem(GroupsModel data) => CustomItem(
      onNavigateTap: () {
        AppService()
            .getBlocData<GroupDetailsCubit>()
            .getGroupDetails(teacherId: data.teacherId!);
        Routes.groupsDetailsRoute.moveToWithArgs({
          GroupsDetailsScreen.whichScreenKey: "default",
          // CoursesDetailsScreen.subjectNameKey: data.subjectId!,
          GroupsDetailsScreen.teacherIdKey: data.teacherId
        });
        print(data.teacherId);
      },
      isSubScribe: true,
      groupsModel: data);
}
