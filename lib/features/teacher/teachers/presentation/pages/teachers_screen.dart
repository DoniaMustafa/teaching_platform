import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_teacher_search.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_trachers.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _CoursesGroupsScreenState();
}

class _CoursesGroupsScreenState extends State<TeachersScreen> {
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
            20.vs,
            CustomSubjectList(
              isTeacher: true,
              isCourse: false,
            ),
            20.vs,
            BuildTeachers()
          ],
        ),
      ),
    );
  }
}
