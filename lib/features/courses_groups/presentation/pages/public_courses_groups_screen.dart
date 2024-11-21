import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_groubs_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_public_courses_tab_bar_view.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import '../../../../core/export/export.dart';
import '../widgets/build_public_group_tab_bar_view.dart';
import '../widgets/build_search_widget.dart';

class PublicCoursesGroupsScreen extends StatefulWidget {
  const PublicCoursesGroupsScreen({super.key});

  @override
  State<PublicCoursesGroupsScreen> createState() => _CoursesGroupsScreenState();
}

class _CoursesGroupsScreenState extends State<PublicCoursesGroupsScreen> {
  @override
  void initState() {
    super.initState();
    if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7") {
      context.read<PublicCourseCubit>().getPublicCourses();
      context.read<PublicGroupCubit>().getPublicGroups();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().coursesAndGroups.trans,
        anotherWidget: BuildCoursesAndGroupsSearchWidget(),
        widget: Column(
          children: [
            AppPrefs.userRole == "3" ? 40.vs : 20.vs,
            if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7")
              CustomSubjectList(
                isCourse: true,
                isPublicTeacher: true,
              ),
            if (AppPrefs.userRole == "3")
              BuildChildrenDropDownList(
                isPublicCourseGroup: true,
              ),
            10.vs,
            // const BuildPublicGroupsCourses(),
            const BuildCoursesGroupsTabBar(),
            BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
              builder: (context, state) {
                if (context.read<CoursesGroupOperationCubit>().publicTapIndex ==
                    0) {
                  return const BuildPublicCoursesTabBarView();
                } else {
                  return const BuildPublicGroupTabBarView();
                }
              },
            ),
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
