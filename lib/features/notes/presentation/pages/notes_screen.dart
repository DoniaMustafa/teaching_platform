import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_country/build_sign_city.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/widgets/build_notes.dart';
import 'package:teaching/features/notes/presentation/widgets/build_notes_search.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7") {
  //     context.read<NotesCubit>().getNotes();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        paddingTop: 10.h,
        isBackIcon: true,
        anotherWidget: BuildNotesSearch(),
        title: AppStrings().notes.trans,
        widget: Column(
          children: [
            AppPrefs.userRole == "3" ? 40.vs : 20.vs,
            if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7")
              CustomSubjectList(
                isNotes: true,
                isCourse: false,
              ),
            if (AppPrefs.userRole == "3")
              BuildChildrenDropDownList(
                isNotes: true,
              ),
            20.vs,
            BuildNotes(),
          ],
        ),
      ),
    );
  }
}
