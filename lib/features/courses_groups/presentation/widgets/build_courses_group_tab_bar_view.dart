import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/shimmer_widget.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class BuildCoursesGroupTabBarView extends StatelessWidget {
  const BuildCoursesGroupTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CoursesGroupsCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () =>
                  context.read<CoursesGroupsCubit>().getCourserAndGroups(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.courses.isEmpty) {
            return const CustomEmptyWidget();
          }
          return buildTabBarView(state);
        },
      ),
    );
  }

  Widget buildTabBarView(CubitStates state) =>
      BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
        builder: (context, state) {
          return BlocBuilder<CoursesGroupsCubit, CubitStates>(
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 2,
                padding: getPadding(horizontal: 10.w, vertical: 20.h),
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 20.w,
                shrinkWrap: true,
                childAspectRatio: 0.5 / 0.55,
                children: List.generate(
                  state is LoadedState
                      ? (context.read<CoursesGroupOperationCubit>().tabIndex ==
                              0
                          ? state.data.courses.length
                          : state.data.groups.length)
                      : AppConstants.nShimmerItems,
                  (index) {
                    if (state is LoadedState) {
                      if (context.read<CoursesGroupOperationCubit>().tabIndex ==
                          0) {
                        return CustomItem(
                            onTap: () {},
                            isSubScribe: true,
                            coursesModel: state.data.courses[index]);
                      } else {
                        return CustomItem(
                            onTap: () {},
                            isSubScribe: true,
                            groupsModel: state.data.groups[index]);
                      }
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
        },
      );
}