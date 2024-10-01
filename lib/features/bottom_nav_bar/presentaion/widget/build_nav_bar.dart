import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teaching/core/list_states.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/manager/onboading_operation_cubit.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/manager/onboading_operation_cubit.dart';

import '../../../../core/export/export.dart';

class BuildNavBar extends StatelessWidget {
  const BuildNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarOperationCubit, CubitStates>(
      builder: (context, state) {
        return CurvedNavigationBar(height: 65.h,animationCurve: Curves.bounceInOut,
          color: AppColors.mainAppColor,
          backgroundColor: AppColors.white,
          items: List.generate(
              AppAssets().navBar.length,
              (index) => SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: CustomSvg(asset: AppAssets().navBar[index]))),
          onTap: (index)=> context.read<BottomNavBarOperationCubit>().onSelectedItem(index),
        );
      },
    );
  }
}
