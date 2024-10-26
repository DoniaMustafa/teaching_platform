import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_operation_cubit.dart';

class BuildSessionsTabBar extends StatelessWidget {
  const BuildSessionsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionsOfGroupOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomTabBar(
            onTap: (index) => context
                .read<SessionsOfGroupOperationCubit>()
                .onChangeSessionsIndex(index),
            text: AppListsConstant.sessionsTab,
            selectedIndex:
            context.read<SessionsOfGroupOperationCubit>().sessionsIndex
          // : context.read<CoursesGroupOperationCubit>().tapIndex,
        );
      },
    );
  }
}
