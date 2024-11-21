import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/presentation/manager/parents_cubit.dart';
import 'package:teaching/features/parent/presentation/widgets/build_parent_item.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_teacher_item.dart';

class BuildParentList extends StatelessWidget {
  const BuildParentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentsCubit, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return Center(
            child: CustomErrorWidget(
              onTap: () {
                // context.read<ParentsCubit>().g();
              },
              message: state.message,
            ),
          );
        }
        if (state is LoadedState && state.data.isEmpty) {
          return const CustomEmptyWidget();
        }
        return CustomListView(
            itemCount: state is LoadedState
                ? state.data.length
                : AppConstants.shimmerItems,
            // shrinkWrap: true,
            separatorWidget: (BuildContext context, int index) => 20.vs,
            axisDirection: Axis.vertical,
            widget: (BuildContext context, int index) => state is LoadedState
                ? BuildParentItem(
              model: state.data[index],
              onTap: () {
                // AppService()
                //     .getBlocData<TeacherDetailsCubit>()
                //     .getTeacherDetails(
                //     model: TeacherModel(
                //         teacherId: state.data[index].id!));
                // Routes.parentsDetailsRoute.moveTo;
              },
            )
                : CustomShimmer.fromRectangle(
              width: width,
              height: 90,
            ));
      },
    );
  }
}
