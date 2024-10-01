import 'package:teaching/config/routes/app_routes.dart';
import 'package:teaching/core/utils/app_strings.dart';
import 'package:teaching/core/utils/app_style.dart';

import '../../../../core/export/export.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();

  int _currentPage = 0;
  bool _isNavigating = false;
  void _navigateToNext() {
    // setState(() {
    //   _isNavigating = true;
    // });
    print(_currentPage);
    if (_currentPage != 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      // setState(() {
      //   _isNavigating = false;
      // });

      Routes.mainRoute.pushAndRemoveAllUntil;
    }

    // Future.delayed(const Duration(milliseconds: 3000), () {
    //
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildUpWidget,

            _buildDownWidget,

            // 250.vs,
          ],
        ),
      ),
    );
  }

  get _buildUpWidget => Expanded(
        flex: _currentPage == 0 ? 5 : 6,
        child: PageView(
          onPageChanged: (page) {
            _currentPage = page;
            // _isNavigating = false;
            setState(() {});
          },
          physics: NeverScrollableScrollPhysics(),
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
                        width: _currentPage == index ? 5.w : 10.w,
                        margin: getPadding(start: 10.w),
                        decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(8.r)),
                      )),
            ),
            16.52.vs,
            CustomTextWidget(
              text: AppStrings().skip.trans,
              style: getSemiboldTextStyle(),
            ),
            19.48.vs,
            GestureDetector(
              onTap: () => _navigateToNext(),
              child: Stack(
                alignment: _currentPage == 0
                    ? AlignmentDirectional.topCenter
                    : AlignmentDirectional.centerEnd,
                children: [
                  CustomCircleWidget(
                    margin:
                        getMargin(top: 5.h, end: _currentPage == 0 ? 0 : 5.w),
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
