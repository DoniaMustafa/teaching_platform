import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/widget/build_drawer.dart';

import '../../../../core/export/export.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(
    //     'userRole>>>>>>>>>>>>>>>>>>>>>>>>>${AppService().getBlocData<UserCubit>().user!.userRole!}');
    return BlocBuilder<BottomNavBarOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomBackground(
          showSafeArea: true,
          // appbarColor:
          //     context.read<BottomNavBarOperationCubit>().selectedIndex == 0
          //         ? AppColors.mainAppColor
          //         : null,
          // showBack:
          //     context.read<BottomNavBarOperationCubit>().selectedIndex == 0
          //         ? true
          //         : false,
          // showAppbar:
          //     context.read<BottomNavBarOperationCubit>().selectedIndex == 0
          //         ? true
          //         : false,
          // showSafeArea: true,
          drawer: context.read<BottomNavBarOperationCubit>().selectedIndex == 3
              ? buildDrawer()
              : null,
          statusBarColor:
              context.read<BottomNavBarOperationCubit>().selectedIndex == 3
                  ? AppColors.white
                  : AppColors.mainAppColor,
          bottomNavigationBar: const BuildNavBar(),
          child: AppListsConstant.widgetsScreen[
              context.read<BottomNavBarOperationCubit>().selectedIndex],
        );
      },
    );
  }
}
