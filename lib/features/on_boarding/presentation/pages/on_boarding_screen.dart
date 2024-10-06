import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';
import 'package:teaching/features/on_boarding/presentation/widgets/build_inductor_widget.dart';

import '../../../../core/export/export.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();

  // bool _isNavigating = false;

  void _navigateToNext() async {
    // setState(() {
    //   _isNavigating = true;
    // });
    if (context.read<OnboardingManagerCubit>().currentPage != 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      // setState(() {
      //   _isNavigating = false;
      // });
      await context.read<OnboardingManagerCubit>().cachedNewInstall();

      // Routes.mainRoute.pushAndRemoveAllUntil;
    }

    // Future.delayed(const Duration(milliseconds: 3000), () {
    //
    //
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        showSafeArea: true,
        child: BlocBuilder<OnboardingManagerCubit, OnboardingManagerState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildUpWidget,
                10.vs,
                _buildDownWidget
                // BuildInductorWidget()
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(2, (index)=>CustomCard(
                //   backgroundColor: AppColors.mainAppColor,width: 5,height: 3,
                // )),)
              ],
            );
          },
        ));
  }

  get _buildUpWidget => Expanded(
        flex: context.read<OnboardingManagerCubit>().currentPage == 0 ? 5 : 6,
        child: PageView(
          onPageChanged: (page) => context
              .read<OnboardingManagerCubit>()
              .onChangeOnBoardingWidget(page),
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: List.generate(
              AppListsConstant.onBoardingBody.length,
              (index) =>
                  // AnimatedContainer(
                  //       duration: const Duration(milliseconds: 500),
                  //       curve: Curves.easeInOut,
                  //       transform: _isNavigating && index == _currentPage
                  //           ? Matrix4.translationValues(-width / 0.5, 0, 0)
                  //           : Matrix4.identity(),
                  //       child:
                  BuildOnBoardingBody(
                    data: AppListsConstant.onBoardingBody[index],
                    // ),
                  )),
        ),
      );
  get _buildDownWidget => Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  AppListsConstant.onBoardingBody.length,
                  (index) => Container(
                        height: 5.h,
                        width: context
                                    .read<OnboardingManagerCubit>()
                                    .currentPage ==
                                index
                            ? 5.w
                            : 10.w,
                        margin: getPadding(start: 10.w),
                        decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(8.r)),
                      )),
            ),
            16.52.vs,
            GestureDetector(
              onTap: () async {
                await context.read<OnboardingManagerCubit>().cachedNewInstall();
                Routes.mainRoute.pushAndRemoveAllUntil;
              },
              child: CustomTextWidget(
                text: AppStrings().skip.trans,
                style: getSemiboldTextStyle(),
              ),
            ),
            19.48.vs,
            GestureDetector(
              onTap: () => _navigateToNext(),
              child: Stack(
                alignment:
                    context.read<OnboardingManagerCubit>().currentPage == 0
                        ? AlignmentDirectional.topCenter
                        : AlignmentDirectional.centerEnd,
                children: [
                  CustomCircleWidget(
                    margin: getMargin(
                        top: 5.h,
                        end: context
                                    .read<OnboardingManagerCubit>()
                                    .currentPage ==
                                0
                            ? 0
                            : 5.w),
                    color: AppColors.white,
                    borderColor: AppColors.mainAppColor,
                    child: CustomCircleWidget(
                      color: AppColors.mainAppColor,
                      radius: 30,
                      height: 50.h,
                      width: 50.w,
                      child: const CustomIcon(
                        icon: Icons.arrow_forward,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  CustomCircleWidget(
                    width: 10.w,
                    height: 10.h,
                    color: AppColors.mainAppColor,
                  ),
                ],
              ),
            ),
            // 102.vs,
          ],
        ),
      );
}
