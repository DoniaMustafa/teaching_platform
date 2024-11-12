import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/widget/build_drawer.dart';
import 'package:teaching/local_notification.dart';

import '../../../../core/export/export.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
   {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // EnumService.userDrawerType(AppPrefs.userRole!,);
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
