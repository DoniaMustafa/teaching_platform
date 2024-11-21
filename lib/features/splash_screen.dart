import 'dart:async';

import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../core/export/export.dart';
import '../local_notification.dart';
import 'on_boarding/presentation/manager/onboarding_manager_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    nextScreen(); // Determine the next screen to navigate to
  }

  void nextScreen() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bool isNew = await AppService()
          .getBlocData<OnboardingManagerCubit>()
          .isNewInstalled();
      if (AppPrefs.userRole == "1") {
        await AppService().getBlocData<UserCubit>().getUsersData();
      }

      UserModel? user = await AppService().getBlocData<UserCubit>().getUser();
      String token = await AppService().getBlocData<UserCubit>().getToken();
      await AppService().getBlocData<UserCubit>().getUserRole();

      Timer(Duration(seconds: 5), () {
        if (isNew.isTrue) {
          Routes.onBoardRoute.moveToAndRemoveCurrent;
        } else {
          if (AppPrefs.userRole == "7"||AppPrefs.userRole == "2") {
            if (AppPrefs.token.isNotNullOrEmpty &&
                AppPrefs.userRole.isNotNullOrEmpty) {
              Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
            } else {
              Routes.mainRoute.pushAndRemoveAllUntil;
            }
          } else {
            if (AppPrefs.user.isNotNull &&
                AppPrefs.token.isNotNullOrEmpty &&
                AppPrefs.userRole.isNotNullOrEmpty) {
              Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
            } else {
              Routes.mainRoute.pushAndRemoveAllUntil;
            }
          }
        }
      });
    });
  }
  // void initSlidingAnimation() {
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 3),
  //   );
  //   slidingAnimation =
  //       Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
  //           .animate(animationController);
  //   animationController.forward();
  // }
  // @override
  // void dispose() {
  //   animationController.dispose();
  //   super.dispose();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.fillBackgroundColor,
        backgroundColor: AppColors.fillBackgroundColor,
        child: Center(
            child: CustomImageWidget(
          asset: AppAssets().logo,
          height: 150.h,
          width: 150.w,
        )));
  }

  // Widget animationMethod({widget, slidingController}) {
  //   return AnimatedBuilder(
  //     animation: slidingController,
  //     builder: (BuildContext context, _) {
  //       return SlideTransition(
  //         position: slidingController,
  //         child: widget,
  //       );
  //     },
  //   );
  // }
}
