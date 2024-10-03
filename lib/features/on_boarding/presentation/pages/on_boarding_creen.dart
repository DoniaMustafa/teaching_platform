import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';

import '../../../../core/export/export.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // PageController _pageController = PageController();

  // // bool _isNavigating = false;
  //
  // void _navigateToNext() async {
  //   // setState(() {
  //   //   _isNavigating = true;
  //   // });
  //   if (context.read<OnboardingManagerCubit>().currentPage != 1) {
  //     _pageController.nextPage(
  //         duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  //   } else {
  //     // setState(() {
  //     //   _isNavigating = false;
  //     // });
  //
  //     Routes.mainRoute.pushAndRemoveAllUntil;
  //     await context.read<OnboardingManagerCubit>().cachedNewInstall();
  //   }
  //
  //   // Future.delayed(const Duration(milliseconds: 3000), () {
  //   //
  //   //
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      statusBarColor: AppColors.white,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: 500.h,
          width: 400.w,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              color: AppColors.mainAppColor),
        ),
        // Column(
        //   // mainAxisSize: MainAxisSize.min,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   // crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       alignment: Alignment.center,
        //       height: 500.h,
        //       width: 400.w,
        //       decoration: BoxDecoration(
        //           // borderRadius: BorderRadius.circular(20),
        //           color: AppColors.mainAppColor),
        //     ),
        //     // _buildUpWidget,
        //     // _buildDownWidget,
        //     250.vs,
        //   ],
        // ),
      ),
    );
  }

  // get _buildUpWidget => SizedBox(
  //       height: 500,
  //       child: BlocBuilder<OnboardingManagerCubit, OnboardingManagerState>(
  //         builder: (context, state) {
  //           return PageView(
  //             onPageChanged: (page) => context
  //                 .read<OnboardingManagerCubit>()
  //                 .onChangeOnBoardingWidget(page),
  //             physics: const NeverScrollableScrollPhysics(),
  //             controller: _pageController,
  //             children: List.generate(
  //                 AppListsConstant.onBoardingBody.length,
  //                 (index) =>
  //                     // AnimatedContainer(
  //                     //       duration: const Duration(milliseconds: 500),
  //                     //       curve: Curves.easeInOut,
  //                     //       transform: _isNavigating && index == _currentPage
  //                     //           ? Matrix4.translationValues(-width / 0.5, 0, 0)
  //                     //           : Matrix4.identity(),
  //                     //       child:
  //                     BuildOnBoardingBody(
  //                       data: AppListsConstant.onBoardingBody[index],
  //                       // ),
  //                     )),
  //           );
  //         },
  //       ),
  //     );
  //
  // get _buildDownWidget => Container(
  //       width: 400,
  //       height: 500,
  //       // color: AppColors.red,
  //       // padding: getPadding(
  //       //   horizontal: 20,
  //       // ),
  //       child: Column(
  //         // crossAxisAlignment: CrossAxisAlignment.center,
  //         // mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           // BuildInductorWidget(),
  //
  //           10.vs,
  //
  //           // CustomCircleWidget(
  //           //   height: 80.h,
  //           //   width: 50.w,  radius: 25,
  //           //   margin: getMargin(
  //           //       top: 5.h,
  //           //       end: context.read<OnboardingManagerCubit>().currentPage == 0
  //           //           ? 0
  //           //           : 5.w),
  //           //   color: AppColors.black,
  //           //   borderColor: AppColors.mainAppColor,
  //           //   // child: CustomCircleWidget(
  //           //   //   color: AppColors.mainAppColor,
  //           //   //   radius: 30,
  //           //   //   height: 50.h,
  //           //   //   width: 50.w,
  //           //   //   child: const CustomIcon(
  //           //   //     icon: Icons.arrow_forward,
  //           //   //     color: AppColors.white,
  //           //   //   ),
  //           //   // ),
  //           // ),
  //           // 16.52.vs,
  //           // GestureDetector(
  //           //   onTap: () => Routes.mainRoute.pushAndRemoveAllUntil,
  //           //   child: CustomTextWidget(
  //           //     text: AppStrings().skip.trans,
  //           //     style: getSemiboldTextStyle(),
  //           //   ),
  //           // ),
  //           // 19.48.vs,
  //           // SizedBox(
  //           //   width: 50,
  //           //   height: 50,
  //           //   child: GestureDetector(
  //           //     onTap: () => _navigateToNext(),
  //           //     child: Stack(
  //           //       alignment:
  //           //           context.read<OnboardingManagerCubit>().currentPage == 0
  //           //               ? AlignmentDirectional.topCenter
  //           //               : AlignmentDirectional.centerEnd,
  //           //       children: [
  //           //         CustomCircleWidget(
  //           //           margin: getMargin(
  //           //               top: 5.h,
  //           //               end: context
  //           //                           .read<OnboardingManagerCubit>()
  //           //                           .currentPage ==
  //           //                       0
  //           //                   ? 0
  //           //                   : 5.w),
  //           //           color: AppColors.white,
  //           //           borderColor: AppColors.mainAppColor,
  //           //           child: CustomCircleWidget(
  //           //             color: AppColors.mainAppColor,
  //           //             radius: 30,
  //           //             height: 50.h,
  //           //             width: 50.w,
  //           //             child: const CustomIcon(
  //           //               icon: Icons.arrow_forward,
  //           //               color: AppColors.white,
  //           //             ),
  //           //           ),
  //           //         ),
  //           //         CustomCircleWidget(
  //           //           width: 10.w,
  //           //           height: 10.h,
  //           //           color: AppColors.mainAppColor,
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           // 102.vs,
  //         ],
  //       ),
  //     );
}
