import 'package:teaching/features/courses_groups/presentation/manager/public_coures_group_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_groubs_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_tab_bar_view.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_group_tab_bar_view.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_public_courses_tab_bar_view.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_public_groups_courses.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import '../../../../core/export/export.dart';
import '../widgets/build_public_group_tab_bar_view.dart';

class PublicCoursesGroupsScreen extends StatefulWidget {
  const PublicCoursesGroupsScreen({super.key});

  @override
  State<PublicCoursesGroupsScreen> createState() => _CoursesGroupsScreenState();
}

class _CoursesGroupsScreenState extends State<PublicCoursesGroupsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PublicCouresGroupCubit>().getPublicGroupsCourses();
    // context.read<GroupsCubit>().getGroups();
    context.read<SubjectsCubit>().getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().coursesAndGroups.trans,
        widget: const Column(
          children: [
            CustomSubjectList(
              isPublicTeacher: true,
            ),
            // 20.vs,
            BuildPublicGroupsCourses()
            // const BuildCoursesGroupsTabBar(
            //   isPublic: true,
            // ),
            // BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
            //   builder: (context, state) {
            //     if (context.read<CoursesGroupOperationCubit>().publicTapIndex ==
            //         0) {
            //       return BuildPublicCoursesTabBarView();
            //     }
            //     return BuildPublicGroupTabBarView();
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
