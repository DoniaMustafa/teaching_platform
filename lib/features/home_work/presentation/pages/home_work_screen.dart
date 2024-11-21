import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/home_work/presentation/widgets/build_tab_bar_And_tab_view.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';

class HomeWorkScreen extends StatefulWidget {
  const HomeWorkScreen({super.key});

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AppPrefs.userRole == "1") {
      context.read<MyHomeworkCubit>().getMyHomeWork(isParent: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            widget: Column(children: [
          20.vs,
          if (AppPrefs.userRole == "1") CustomSubjectList(isHomework: true),
          20.vs,
          if (AppPrefs.userRole == "3")
            BuildChildrenDropDownList(homework: true),
          20.vs,
          Expanded(child: BuildTabBarAndTabView())
        ])));
  }
}
