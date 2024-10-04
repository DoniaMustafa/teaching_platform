import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

import '../manager/coures_group_operation_cubit.dart';

class BuildCoursesGroupsTabBar extends StatelessWidget {
  const BuildCoursesGroupsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomTabBar(
          onTap: (index) => context
              .read<CoursesGroupOperationCubit>()
              .onChangeTabIndex(index),
          text: AppListsConstant.subscribeTab,
          selectedIndex: context.read<CoursesGroupOperationCubit>().tabIndex,
        );
      },
    );
  }
}
