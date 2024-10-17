import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/widget/build_drawer.dart';
import 'package:teaching/local_notification.dart';

import '../../../../core/export/export.dart';

mixin DrawerList {
  static List<GenericModel> studentDrawerItems = [
    GenericModel(
      onTap: () {},
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().childrenSubscription.trans,
    ),
    GenericModel(
      onTap: () => Routes.teachersRoute.moveTo,
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().tasks.trans,
    ),
    GenericModel(
      onTap: () => Routes.coursesGroupsRoute.moveTo,
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().courses.trans,
    ),
    GenericModel(
      onTap: () {},
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().parent.trans,
    ),
    GenericModel(
      onTap: () {},
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().challenges.trans,
    ),
    GenericModel(
      onTap: () {},
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().myGrades.trans,
    ),
    GenericModel(
      onTap: () {},
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().firstStudents.trans,
    ),
    //
    GenericModel(
      onTap: () {},
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().childrenGrades.trans,
    ),
    //
    // GenericModel(
    //   image: AppAssets().teacher,
    //   // role: 'lecture',
    //   title: AppStrings().homeWork.trans,
    // ),
    GenericModel(
      onTap: () =>
          // print('route');
          Routes.settingsRoute.moveTo,
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().settings.trans,
    ),
    GenericModel(
      onTap: () {},
      // onTap: AppService().getBlocData<UserCubit>().logout(),
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().logout.trans,
    ),
  ];
}

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with DrawerList {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EnumService.userDrawerType(AppPrefs.user!.userRole!);
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return BlocBuilder<BottomNavBarOperationCubit, CubitStates>(
          builder: (context, state) {
            return CustomBackground(
              showSafeArea: true,
              drawer:
                  context.read<BottomNavBarOperationCubit>().selectedIndex == 3
                      ? const BuildDrawer()
                      : null,
              statusBarColor:
                  context.read<BottomNavBarOperationCubit>().selectedIndex == 3
                      ? AppColors.white
                      : AppColors.mainAppColor,
              bottomNavigationBar: const BuildNavBar(),
              child: BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                return AppListsConstant.widgetsScreen[
                    context.read<BottomNavBarOperationCubit>().selectedIndex];
              }),
            );
          },
        );
      },
    );
  }
}
