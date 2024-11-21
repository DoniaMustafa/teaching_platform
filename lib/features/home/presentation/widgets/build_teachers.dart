import 'package:teaching/core/widget/common_item_widgets/custom_item.dart';
import 'package:teaching/core/widget/common_item_widgets/custom_teatcher_item.dart';
import 'package:teaching/core/widget/shimmer_widget.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_student_cubit.dart';

import '../../../../core/export/export.dart';

class BuildTeachers extends StatelessWidget {
  const BuildTeachers({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 220.h,
      child:  BlocBuilder<TeachersOfStudentCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(
                onTap: () =>
                    context.read<TeachersOfStudentCubit>().getTeacherOfStudent(),
                message: state.message,
              );
            }
            if (state is LoadedState && state.data.isEmpty) {
              return const CustomEmptyWidget();
            }
            return buildTeachersOfStudentList(state);
          }));
  }

  Widget buildTeachersOfStudentList(CubitStates state) {
    return CustomListView( axisDirection: Axis.horizontal,
        separatorWidget: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemCount: state is LoadedState
            ? state.data.length
            : AppConstants.nShimmerItems,
        widget: (context, index) => state is LoadedState
            ? CustomTeacherItem(
      teacher: state.data[index],
        )
            : CustomShimmer.fromRectangle(
          height: 150.h,
          width: 200,
        ));
  }
}
