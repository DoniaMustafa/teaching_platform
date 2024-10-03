import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/shimmer_widget.dart';

class BuildSubscriptionTabBarView extends StatelessWidget {
  const BuildSubscriptionTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // height: 50.h,
        child: BlocBuilder<CoursesGroupsCubit, CubitStates>(
            builder: (context, state) {
      if (state is FailedState) {
        return CustomErrorWidget(
          onTap: () => context.read<CoursesGroupsCubit>().getCourserAndGroups(),
          message: state.message,
        );
      }
      if (state is LoadedState && state.data.courses.isEmpty) {
        return const CustomEmptyWidget();
      }
      return buildTabBarView(state);
    }));
  }

  Widget buildTabBarView(CubitStates state) => GridView.count(
      crossAxisCount: 2,
      padding: getPadding(horizontal: 10.w, vertical: 20.h),
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 20.w,
      shrinkWrap: true,
      childAspectRatio: 0.5 / 0.55,
      children: List.generate(
        state is LoadedState
            ? state.data.courses.length
            : AppConstants.nShimmerItems,
        (index) {
          return state is LoadedState
              ? CustomItem(
                  onTap: () {},
                  isSubScribe: true,
                  coursesModel: state.data.courses[index],
                )
              : CustomShimmer.fromRectangle(
                  height: 150.h,
                  width: 200,
                );
        },
      ));
}
