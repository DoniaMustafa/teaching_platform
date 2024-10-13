import '../../../../core/export/export.dart';
import '../manager/public_coures_group_cubit.dart';

class BuildPublicGroupsCourses extends StatelessWidget {
  const BuildPublicGroupsCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PublicCouresGroupCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context
                  .read<PublicCouresGroupCubit>()
                  .getPublicGroupsCourses(),
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

  Widget buildTeachersItem(CoursesModel data) => CustomItem(
      onNavigateTap: () {
        // context.read<CoursesDetailsCubit>().getCoursesDetails(TeacherModel(
        //     subjectId: state.data[index].subjectId!,
        //     teacherId: state.data[index].teacherId!));
        Routes.coursesGroupsRoute.moveTo;
      },
      isSubScribe: true,
      coursesModel: data);
}
// return
