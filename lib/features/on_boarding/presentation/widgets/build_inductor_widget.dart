import '../../../../core/export/export.dart';
import '../manager/onboarding_manager_cubit.dart';

class BuildInductorWidget extends StatelessWidget {
  const BuildInductorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          2,
          (index) => CustomCard(
            height: 5.h,
              width: context.read<OnboardingManagerCubit>().currentPage == index ? 5.w : 10.w,
            radius: 8.r,backgroundColor: AppColors.mainAppColor,
            margin: getPadding(start: 10.w),
           //           decoration: BoxDecoration(
           // color: AppColors.mainAppColor,
           // // radius: 8.r,
           //           ),
          )
              // Container(
              //   height: 33.h,
              //   width: context.read<OnboardingManagerCubit>().currentPage ==
              //           index
              //       ? 5.w
              //       : 10.w,
              //   margin: getPadding(start: 10.w),
              //   decoration: BoxDecoration(
              //       color: AppColors.mainAppColor,
              //       borderRadius: BorderRadius.circular(8.r)),
              // )
      ),
    );
  }
}
