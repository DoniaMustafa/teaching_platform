import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/presentation/manager/delete_student_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';

class BuildChildrenList extends StatelessWidget {
  const BuildChildrenList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentChildrenCubit, CubitStates>(
        builder: (context, state) {
      if (state is FailedState) {
        return CustomErrorWidget(message: state.message, onTap: () {});
      }
      if (state is LoadedState && state.data.isEmpty) {
        return const CustomEmptyWidget();
      }
      return _buildListChildren(state);
    });
  }

  Widget _buildListChildren(CubitStates state) => CustomListView(
      separatorWidget: (context, index) => 20.vs,
      itemCount:
          state is LoadedState ? state.data.length : AppConstants.nShimmerItems,
      widget: (context, index) => state is LoadedState
          ? CustomListTile(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 5,
                    color: AppColors.black.withOpacity(0.25))
              ],
              widget: GestureDetector(
                onTap: () {
                  context.read<DeleteStudentCubit>().addStudentRequest(
                      studentId: state.data[index].studentId);
                },
                child: CustomCard(
                  padding: getPadding(vertical: 5.h, horizontal: 8.w),
                  backgroundColor: AppColors.red,
                  child: const CustomIcon(
                    icon: Icons.delete,
                    color: AppColors.white,
                  ),
                ),
              ),
              title: state.data[index].studentName,
              padding: getPadding(horizontal: 20.w, vertical: 15.h),
              dividerHeight: height / 13,
              r: 0,
              isBorder: false,
            )
          : CustomShimmer(
              width: width,
              height: 60.h,
              borderRadius: BorderRadiusDirectional.circular(10.r),
            ));
}
