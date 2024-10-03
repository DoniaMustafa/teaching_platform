import 'dart:async';

import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../core/export/export.dart';
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
      bool isLanguageSaved =
          await AppService().getBlocData<LanguageCubit>().getSavedLanguage();
      bool isNew = await AppService()
          .getBlocData<OnboardingManagerCubit>()
          .isNewInstalled();
      UserModel? user = await AppService().getBlocData<UserCubit>().getUser();
      String token = await AppService().getBlocData<UserCubit>().getToken();
      String deviceToken =
          await AppService().getBlocData<UserCubit>().getToken();
      //  bool isLocationEnabled = await checkLocationPermission(context);

//      bool isNotificationInit = (await NotificationsService().initialize()).orFalse;
      //     print("is notification granted$isNotificationInit");
      //   print("new install ${isNew}");
      print("token is ${token}");
      // print("driver is ${driver!.isAvailable}");
      // print("driver is ${driver.image}");
      // print("driver is ${driver.name}");      print("driver is ${driver.email}");

      // print("device token is ${deviceToken}");
      print("token from prefs is ${AppPrefs.token}");
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
      //     print('driver isNotEmpty ????????????????? $user');
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
      // Timer.periodic(Duration(milliseconds: 1000),(timer){
        if(isNew.isTrue){
          Routes.mainRoute.moveToAndRemoveCurrent;
        }else{
          if (user.isNotNull && token.isNotNullOrEmpty) {
            Routes.bottomNavigationRoute.moveToAndRemoveCurrent;
          }
          else {
            Routes.loginRoute.moveToAndRemoveCurrent;
          }
        }

      });


    // });
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
    return Scaffold(
        backgroundColor: AppColors.fillColor,
        body: Directionality(
          textDirection: TextDirection.ltr,
          // child: animationMethod(
        child: Center(
                  child: CustomImageWidget(
                asset: AppAssets().logo,
                height: 150.h,
                width: 150.w,
              )),
              // slidingController: slidingAnimation),
        ))

    ;
  }

  Widget animationMethod({widget, slidingController}) {
    return AnimatedBuilder(
      animation: slidingController,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidingController,
          child: widget,
        );
      },
    );
  }
}
