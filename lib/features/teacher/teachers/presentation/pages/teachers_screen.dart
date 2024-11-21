import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_teacher_search.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_trachers.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        anotherWidget: BuildTeacherSearch(),
        title: AppStrings().teachers.trans,
        widget: Column(
          children: [
            AppPrefs.userRole == "3"?40.vs: 20.vs,
            if (AppPrefs.userRole == "1")
              CustomSubjectList(
                isTeacher: true,
                isCourse: false,
              ),
            if (AppPrefs.userRole == "3")
              BuildChildrenDropDownList(
                isTeacher: true,
              ),
            20.vs,
            BuildTeachers()
          ],
        ),
      ),
    );
  }
}
