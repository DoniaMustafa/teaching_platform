import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/widgets/delivered_tab_bar_view.dart';

class BuildTabBarAndTabView extends StatelessWidget {
  const BuildTabBarAndTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeworkOperationCubit, CubitStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTabBar(
                onTap: (index) => context
                    .read<HomeworkOperationCubit>()
                    .onChangeTapIndex(index),
                text: AppListsConstant.homeworkTab,
                selectedIndex: context.read<HomeworkOperationCubit>().tapIndex),
            10.vs,
            const Expanded(
              child: HomeWorkTabBarView(),
            )
          ],
        );
      },
    );
  }
}
