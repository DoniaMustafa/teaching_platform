import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';

class BuildCoursesGroupsTabBar extends StatelessWidget {
  const BuildCoursesGroupsTabBar({super.key, this.isPublic = false});
  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomTabBar(
            onTap: (index) => context
                .read<CoursesGroupOperationCubit>()
                .onChangePublicTabIndex(index),
            text: AppListsConstant.subscribeTab,
            selectedIndex:
                context.read<CoursesGroupOperationCubit>().publicTapIndex
            // : context.read<CoursesGroupOperationCubit>().tapIndex,
            );
      },
    );
  }
}
