import 'package:teaching/core/widget/shimmer_widget.dart';

import '../../../../core/export/export.dart';

class BuildCourses extends StatelessWidget {
  const BuildCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.h,
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
          return buildCoursesList(state);
        }));
  }

  Widget buildCoursesList(CubitStates state) {
    return CustomListView(
        separatorWidget: (context, index) => SizedBox(
              width: 20.w,
            ),
        itemCount: state is LoadedState
            ? state.data.courses.length
            : AppConstants.nShimmerItems,
        widget: (context, index) => state is LoadedState
            ? CustomItem(
                coursesModel: state.data.courses[index],
              )
            : CustomShimmer.fromRectangle(
                height: 150.h,
                width: 200,
              ));
  }
}
