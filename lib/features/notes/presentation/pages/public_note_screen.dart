import 'package:teaching/features/notes/presentation/manager/notes_public_cubit.dart';
import 'package:teaching/features/notes/presentation/widgets/grouped_note/build_grouped_note_search_widget.dart';
import 'package:teaching/features/notes/presentation/widgets/grouped_note/build_public_notes.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import '../../../../core/export/export.dart';

class PublicNoteScreen extends StatefulWidget {
  const PublicNoteScreen({super.key});

  @override
  State<PublicNoteScreen> createState() => _PublicNoteScreenState();
}

class _PublicNoteScreenState extends State<PublicNoteScreen> {
  @override
  void initState() {
    super.initState();
    if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7") {
      context.read<NotesPublicCubit>().getPublicNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().notes.trans,
        anotherWidget: BuildGroupedNoteSearchWidget(),
        widget: Column(
          children: [
            AppPrefs.userRole == "3" ? 40.vs : 20.vs,
            if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7")
              CustomSubjectList(
                isCourse: true,
                isPublicTeacher: true,
              ),

            10.vs,
            const BuildPublicNotes(),
          ],
        ),
        // CustomListView(
        //     axisDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     itemCount: 20,
        //     widget: (context, index) => BuildScheduleItem()),
      ),
    );
  }
}
