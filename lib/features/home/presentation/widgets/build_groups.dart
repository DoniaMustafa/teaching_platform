import 'package:teaching/core/widget/common_item_widgets/custom_item.dart';
import 'package:teaching/core/widget/shimmer_widget.dart';

import '../../../../core/export/export.dart';

class BuildGroups extends StatelessWidget {
  const BuildGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CoursesGroupsCubit, CubitStates>(
        builder: (context, state) {
      if (state is FailedState) {
        return CustomErrorWidget(
          onTap: () =>
              context.read<CoursesGroupsCubit>().getCourserAndGroups(),
          message: state.message,
        );
      }
      if (state is LoadedState && state.data.groups.isEmpty) {
        return const SizedBox.shrink();
      }
      return AspectRatio(
          aspectRatio: 1.5/0.9,child: buildCoursesList(state));
    });
  }

  Widget buildCoursesList(CubitStates state) {
    return CustomListView(
        separatorWidget: (context, index) => SizedBox(
              width: 20.w,
            ),
        itemCount: state is LoadedState
            ? state.data.groups.length
            : AppConstants.nShimmerItems,
        widget: (context, index) => state is LoadedState
            ? CustomItem(
                groupsModel: state.data.groups[index],
              )
            : CustomShimmer.fromRectangle(
                height: 150.h,
                width: 1,
              ));
  }
}
