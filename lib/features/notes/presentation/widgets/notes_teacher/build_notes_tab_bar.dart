import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_operation_cubit.dart';

class BuildNotesTabBar extends StatelessWidget {
  const BuildNotesTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomTabBar(
            onTap: (index) => context
                .read<NotesOperationCubit>()
                .onChangeNotesIndex(index),
            text: AppListsConstant.notes,
            selectedIndex: context.read<NotesOperationCubit>().notesIndex

            );
      },
    );
  }
}
