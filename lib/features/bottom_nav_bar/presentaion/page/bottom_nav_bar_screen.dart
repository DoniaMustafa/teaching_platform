import 'package:teaching/features/bottom_nav_bar/presentaion/widget/build_drawer.dart';

import '../../../../core/export/export.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarOperationCubit, CubitStates>(
      builder: (context, state) {
        return CustomBackground(
          showSafeArea: true,
          drawer: context.read<BottomNavBarOperationCubit>().selectedIndex == 3
              ? buildDrawer()
              : null,
          statusBarColor: AppColors.white,
          bottomNavigationBar: const BuildNavBar(),
          child: AppListsConstant.widgetsScreen[3
              // context.read<BottomNavBarOperationCubit>().selectedIndex
              ],
        );
      },
    );
  }
}
