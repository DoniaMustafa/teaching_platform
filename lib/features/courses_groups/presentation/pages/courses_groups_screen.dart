import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_groubs_tab_bar.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_courses_group_tab_bar_view.dart';
import 'package:teaching/features/subscription/presentation/widgets/custom_subject_list.dart';
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
    context.read<CoursesGroupsCubit>().getCourserAndGroups();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().coursesAndGroups.trans,
        widget: Column(
          children: [
            CustomSubjectList(
              label: 'لغة عربيه',
              onTap: () {},
              image: AppAssets().exam,
            ),
            20.vs,
            const BuildCoursesGroupsTabBar(),
            const BuildCoursesGroupTabBarView(),
            10.vs,
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
