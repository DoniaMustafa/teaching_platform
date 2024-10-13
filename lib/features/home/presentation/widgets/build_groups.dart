import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';

import '../../../../core/export/export.dart';
import '../manager/groups_cubit.dart';

class BuildGroups extends StatelessWidget {
  const BuildGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsCubit, CubitStates>(builder: (context, state) {
      if (state is FailedState) {
        return SizedBox.shrink();
      }
      if (state is LoadedState && state.data.isEmpty) {
        return const SizedBox.shrink();
      }
      return AspectRatio(
          aspectRatio: 1.5 / 0.9, child: buildCoursesList(state));
    });
  }

  Widget buildCoursesList(CubitStates state) {
    return CustomListView(
        separatorWidget: (context, index) => 20.hs,
        itemCount: state is LoadedState
            ? state.data.length
            : AppConstants.nShimmerItems,
        widget: (context, index) => state is LoadedState
            ? CustomItem(
                onTap: () {
                  context
                      .read<GroupDetailsCubit>()
                      .getGroupDetails(teacherId: state.data[index].teacherId);
                  Routes.groupsDetailsRoute.moveTo;
                },
                groupsModel: state.data[index],
              )
            : CustomShimmer.fromRectangle(
                borderRadius: BorderRadiusDirectional.circular(20.r),
                height: 100.h,
                width: 110,
              ));
  }
}
