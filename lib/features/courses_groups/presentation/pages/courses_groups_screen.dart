import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_groubs_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_tab_bar_view.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_group_tab_bar_view.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import '../../../../core/export/export.dart';

class CoursesGroupsScreen extends StatefulWidget {
  const CoursesGroupsScreen({super.key});

  @override
  State<CoursesGroupsScreen> createState() => _CoursesGroupsScreenState();
}

class _CoursesGroupsScreenState extends State<CoursesGroupsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesCubit>().getCourser();
    context.read<GroupsCubit>().getGroups();
    context.read<SubjectsCubit>().getSubjects();
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
            const BuildCoursesGroupsTabBar(),
            BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
              builder: (context, state) {
                if (context.read<CoursesGroupOperationCubit>().tapIndex == 0) {
                  return BuildCoursesTabBarView();
                }
                return BuildGroupTabBarView();
              },
            ),
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
