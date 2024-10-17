import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';

import '../../../../course/courses_details/presentation/pages/courses_details_screen.dart';

class BuildGroupTabBarView extends StatelessWidget {
  const BuildGroupTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GroupsCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<GroupsCubit>().getGroups(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return buildTabBarView(state);
        },
      ),
    );
  }

  Widget buildTabBarView(CubitStates state) =>
      BlocBuilder<GroupsCubit, CubitStates>(
        builder: (context, state) {
          return GridView.count(
            crossAxisCount: 2,
            padding: getPadding(horizontal: 10.w, vertical: 20.h),
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
                  // return CustomItem(
                  //       onTap: () {
                  //         context
                  //             .read<CoursesDetailsCubit>()
                  //             .getCoursesDetails(TeacherModel(
                  //                 subjectId:
                  //                     state.data.courses[index].subjectId!,
                  //                 teacherId: state
                  //                     .data.courses[index].teacherId!));
                  //       },
                  //       // isSubScribe: true,
                  //       coursesModel: state.data.courses[index]);
                  // } else {
                  return CustomItem(
                      onTap: () {
                        Routes.coursesDetailsRoute.moveToWithArgs({
                          // CoursesDetailsScreen.whichScreenKey:'TeacherDetails',
                          // CoursesDetailsScreen.subjectNameKey:  state.data[index].subjectId!,
                          CoursesDetailsScreen.teacherIdKey:state.data[index].teacherId!});
                      },
                      // isSubScribe: true,
                      groupsModel: state.data[index]);
                  // }
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
      );
}
