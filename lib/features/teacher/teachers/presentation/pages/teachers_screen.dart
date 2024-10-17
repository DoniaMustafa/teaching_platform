import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
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
    // context.read<GroupsCubit>().getGroups();
    // context.read<SubjectsCubit>().getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().coursesAndGroups.trans,
        widget: Column(
          children: [
            CustomSubjectList(),
            20.vs,
            BuildTeachers()
            // const BuildTeachersTabBar(),
            // BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
            //   builder: (context, state) {
            //     if (context.read<CoursesGroupOperationCubit>().tapIndex == 0) {
            //       return BuildCoursesTabBarView();
            //     }
            //     return BuildGroupTabBarView();
            //   },
            // ),
            // 10.vs,
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
