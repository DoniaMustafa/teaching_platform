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
    // TODO: implement initState
    super.initState();
    // hideKeyboard;
    // initSlidingAnimation(); // Initialize the sliding animation
    nextScreen(); // Determine the next screen to navigate to
  }

  // Timer? timer;
  // int counter = 0;
  // String? route;
  // Map<String, dynamic>? data;
  void nextScreen() {
    //   timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
    //     counter++;
    //     if (route.isNotNull && counter >= 5) {
    //       if (data != null) {
    //         route!.moveReplacementWithData(data);
    //       } else {
    //         route!.moveToAndRemoveCurrent; // Navigate and remove splash screen
    //       }
    //       timer.cancel();
    //     }
    //   });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // bool isLanguageSaved =
      //     await AppService().getBlocData<LanguageCubit>().getSavedLanguage();
      bool isNew = await AppService()
          .getBlocData<OnboardingManagerCubit>()
          .isNewInstalled();
      UserModel? user = await AppService().getBlocData<UserCubit>().getUser();
      String token = await AppService().getBlocData<UserCubit>().getToken();
      //  bool isLocationEnabled = await checkLocationPermission(context);
      // bool isGranted = await checkNotificationPermission(context);
      // if (isGranted.isTrue) {
      //
      // }
//      bool isNotificationInit = (await NotificationsService().initialize()).orFalse;
      //     print("is notification granted$isNotificationInit");
      //   print("new install ${isNew}");
      print("token is ${AppPrefs.token}");
      // print("driver is ${driver!.isAvailable}");
      // print("driver is ${driver.image}");
      // print("driver is ${driver.name}");      print("driver is ${driver.email}");

      // print("device token is ${deviceToken}");
      print("token from prefs is ${AppPrefs.token}");
      // print('user Role  from prefs>>>>>>>>>>>>>>> ${AppPrefs.user!.userRole}');

      // print("device token from prefs is ${AppPrefs.deviceToken}");
      // if (driver.isNotNull) {
      //   print("driver step is ${driver.step}");
      // }
      // if (isLanguageSaved.isFalse) {
      //   route = Routes.selectLanguageRoute;
      // } else if (isNew.isTrue) {
      //   route = Routes.onBoardingRoute;
      // } else {
      //   if (user.isNotNull) {
      //     print('driver isNotEmpty ?????????????????96 $user');
      //     (user);
      //     if (token.isNotEmpty ) {
      //       print('token isNotEmpty ????????????????? $token');
      //       print('deviceToken isNotEmpty ????????????????? $deviceToken');
      //       // print('driver!.step ????????????????? ${user.step}');
      //       // if (user.stepsNo == "registered") {
      //       //   print('driver!.step ????????????????? $user!.step');
      //       //   route = Routes.bottomNavigationRoute;
      //       //   //   route = Routes.tripRoute.moveTo;
      //       // } else {
      //         print('stepperRoute ????????????????? $token');
      //         print('stepperRoute ????????????????? $user');
      //
      //   //       route = Routes.bottomNavigationRoute;
      //   //       data = {'step': user.step!.toInt - 1};
      //   //     } //    AppService().showToast(message: "tokens error", alertType: AlertTypes.error);
      //   //   } else {
      //   //     route = Routes.loginRoute;
      //   //   }
      //   // } else {
      //   //   route = Routes.loginRoute;
      //   // }
      // });
      Timer(Duration(seconds: 5), () {
        if (isNew.isTrue) {
          Routes.onBoardRoute.moveToAndRemoveCurrent;
        } else {
          if (AppPrefs.user.isNotNull && AppPrefs.token.isNotNullOrEmpty) {
            Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
          } else {
            Routes.mainRoute.pushAndRemoveAllUntil;
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
