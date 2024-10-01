import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching/core/utils/app_colors.dart';
import 'package:teaching/core/utils/extensions.dart';
import 'package:teaching/features/main_register/presentation/pages/main_register_screen.dart';
import 'package:teaching/features/on_boarding/presentation/pages/on_boarding_creen.dart';
import 'package:teaching/features/auth/presentation/pages/choose_role_screen.dart';
import 'package:teaching/features/auth/presentation/pages/chosse_professional_courses_screen.dart';
import 'package:teaching/features/auth/presentation/pages/education_type_screen.dart';
import 'package:teaching/features/auth/presentation/pages/forgrt_password_screen.dart';
import 'package:teaching/features/auth/presentation/pages/login_screen.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_py_phone_screen.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/splash_screen.dart';

import '../../features/bottom_nav_bar/presentaion/page/bottom_nav_bar_screen.dart';
import '../../features/language/presentation/managers/language_cubit/language_cubit.dart';
import '../../features/auth/presentation/pages/upload_resume_screen.dart';

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

class Routes {
  Routes._internal();
  static const String splashRoute = "/";
  static const String onBoardingRoute = "On Boarding Screen";
  static const String mainRoute = "main";
  static const String loginRoute = "login";
  static const String chooseRoleRoute = "/choose Role";
  static const String signUpRoute = "sign Up";
  // static const String chooseCountryRoute = "/choose Country";
  static const String uploadResumeRoute = "upload Resume Route ";
  static const String signUpPyPhoneRoutes = "signUpPyPhoneRoutes";

  static const String educationTypeRoute = " education Type Trip";
  static const String forgetPassRoute = "forget Password";
  static const String verificationRoute = "verification";
  static const String resetPasswordRoute = "/reset_passsword";
  static const String bottomNavigationRoute = "bottom Navigation Route";
  static const String setPassRoute = "set Password";

  ///*********************************************************************************\\\

  static const String selectLanguageRoute = "/select language";
  //NewTripsScreen
  static const String notificationsRoute = "/notification Route";
  // static const String helpRoute = "/help route";

  // static const String changePassRoute = "change Pass";
  static const String doneRoute = "verified Route";
  static const String homeRoute = "homeScreen";
  static const String reportRoute = "reportScreen";
  static const String verifyRoute = "/otp";
  static const String stepperRoute = "/ Stepper";
  static const String finishStep = "/ finishStep";
  // static const String faqRoute = "FAQs";
  // static const String faqsDetailsRoute = "faqsDetails";
  static const String walletRoute = "Wallet";
  //
  static const String newTripRoute = "New Trip";
  static const String captainInfoRoute = "captain Info";

  static const String subscribtions = "subscribtions";
  //
  static const String myReviews = "my Reviews";
  //
  // static const String termsAndConditionRoute = "Terms And Condition";
  static const String chooseProfessionalCourseRoute =
      "choose Professional Course Route";
  static const String trackingRoute = "Tracking route";
  static const String allSavingTrip = "allSavingTrip";
  static const String documentsRoutes = "documents Route";
  static const String savingTripDetailsRoute = "SavingTripDetailsScreen";

  // static const String chatRoute = "Chat route";
  //*************************** settings rout ********************************/
  static const String personalInformation = "personalInfo";
  static const String editPersonalInformation = "editPersonalInformation";
  static const String fqs = "fqs";
  static const String privacy = "privacy";
  static const String mypackage = "mypackage";
  static const String payments = "payment";
  static const String methodView = "methodView";
  static const String clientInfoRoute = 'clientInfoRoute';
  static const String currentTrips = 'currentTrips';
  static const String ridsScreen = 'ridsScreen';
  static const String tripRoute = 'trip_route';
}

class RouteGenerator {
  RouteGenerator._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 100.milliseconds;
  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    debugPrint(routeSettings.name);
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return buildPageRoute(
            child: const SplashScreen(), routeSettings: routeSettings);
      case Routes.onBoardingRoute:
        return buildPageRoute(
            child: OnBoardingScreen(), routeSettings: routeSettings);

      case Routes.mainRoute:
        return buildPageRoute(
            child: const MainRegisterScreen(), routeSettings: routeSettings);
      case Routes.chooseRoleRoute:
        return buildPageRoute(
            child: const ChooseRoleScreen(), routeSettings: routeSettings);
      case Routes.signUpRoute:
        return buildPageRoute(
            child: SignUpScreen(), routeSettings: routeSettings);

      // case Routes.chooseCountryRoute:
      //   return buildPageRoute(
      //       child: ChooseCountryScreen(), routeSettings: routeSettings);
      case Routes.uploadResumeRoute:
        return buildPageRoute(
            child: UploadResumeScreen(), routeSettings: routeSettings);
      case Routes.signUpPyPhoneRoutes:
        return buildPageRoute(
            child: SignUpByPhoneScreen(), routeSettings: routeSettings);
      case Routes.verificationRoute:
        return buildPageRoute(
            child: VerificationScreen(), routeSettings: routeSettings);

      case Routes.forgetPassRoute:
        return buildPageRoute(
            child: ForgetPasswordScreen(), routeSettings: routeSettings);
      case Routes.chooseProfessionalCourseRoute:
        return buildPageRoute(
            child: ChooseProfessionalCoursesScreen(),
            routeSettings: routeSettings);
      case Routes.bottomNavigationRoute:
        return buildPageRoute(
            child: BottomNavBarScreen(), routeSettings: routeSettings);
      // case Routes.finishStep:
      //   return buildPageRoute(
      //       child: FinishScreen(), routeSettings: routeSettings);
      // case Routes.homeRoute:
      //   return buildPageRoute(
      //       child: const HomeScreen(), routeSettings: routeSettings);
      // // case Routes.newTripRoute:
      // // return buildPageRoute(
      // //     child: NewTripScreen(), routeSettings: routeSettings);
      // case Routes.captainInfoRoute:
      //   return buildPageRoute(
      //       child: CaptainInfoScreen(), routeSettings: routeSettings);
      // case Routes.clientInfoRoute:
      //   return buildPageRoute(
      //       child: TripInfoScreen(), routeSettings: routeSettings);
      // case Routes.allSavingTrip:
      //   return buildPageRoute(
      //       child: SavingTripScreen(), routeSettings: routeSettings);
      // // case Routes.savingTripDetailsRoute:
      // //   return buildPageRoute(
      // //       child: BuildTripsDetails(), routeSettings: routeSettings);
      // case Routes.documentsRoutes:
      //   return buildPageRoute(
      //       child: UploadDocumentScreen(), routeSettings: routeSettings);
      //
      // case Routes.reportRoute:
      //   return buildPageRoute(
      //       child: ReportScreen(), routeSettings: routeSettings);
      // case Routes.chatRoute:
      //   return buildPageRoute(
      //       child: ChatScreen(), routeSettings: routeSettings);
      // case Routes.selectLanguageRoute:
      //   return buildPageRoute(
      //       child: SelectLanguageScreen(), routeSettings: routeSettings);
      //
      case Routes.educationTypeRoute:
        return buildPageRoute(
            child: EducationTypeScreen(), routeSettings: routeSettings);
      // case Routes.payments:
      //   return buildPageRoute(
      //       child: const PaymentMethods(), routeSettings: routeSettings);
      //
      // case Routes.notificationsRoute:
      //   return buildPageRoute(
      //       child: NotificationsScreen(), routeSettings: routeSettings);
      // // case Routes.resetPass:
      // //   return buildPageRoute(
      // //       child: ResetPasswordScreen(), routeSettings: routeSettings);
      // case Routes.privacy:
      //   return buildPageRoute(
      //       child: const PrivacyScreen(), routeSettings: routeSettings);
      // case Routes.mypackage:
      //   return buildPageRoute(child: MyPackage(), routeSettings: routeSettings);
      // case Routes.methodView:
      //   return buildPageRoute(
      //       child: MethodView(), routeSettings: routeSettings);
      //
      // case Routes.myTripsRoute:
      //   return buildPageRoute(
      //       child: MyTripsScreen(), routeSettings: routeSettings);
      // //
      // case Routes.forgetPassRoute:
      //   return buildPageRoute(
      //       child: ForgetPasswordScreen(), routeSettings: routeSettings);
      //
      // // case Routes.currentTrips:
      // //   return buildPageRoute(child: BuildCurrentTrip(), routeSettings: routeSettings);
      // case Routes.ridsScreen:
      //   return buildPageRoute(
      //       child: ScheduleRidesScreen(), routeSettings: routeSettings);
      //
      // case Routes.newSavingTripRoute:
      //   return buildPageRoute(
      //     child: CreateSavingTripScreen(),
      //     routeSettings: routeSettings,
      //   );
      //
      // case Routes.trackingRoute:
      //   return buildPageRoute(
      //       child: TrackingScreen(), routeSettings: routeSettings);
      // case Routes.walletRoute:
      //   return buildPageRoute(
      //       child: const MyWallet(), routeSettings: routeSettings);
      // case Routes.subscribtions:
      //   return buildPageRoute(
      //       child: const MySubscribtions(), routeSettings: routeSettings);
      //
      case Routes.loginRoute:
        return buildPageRoute(
            child: LoginScreen(), routeSettings: routeSettings);
      //
      //
      // case Routes.doneRoute:
      //   return buildPageRoute(
      //       child: DoneScreen(), routeSettings: routeSettings);
      //
      // //*************************** settings rout ********************************/
      //
      // case Routes.personalInformation:
      //   return buildPageRoute(
      //       child: BlocProvider(
      //         create: (context) => ErrorCubit(),
      //         child: const PersonalInformationScreen(),
      //       ),
      //       routeSettings: routeSettings);
      // case Routes.editPersonalInformation:
      //   return buildPageRoute(
      //       child: ProfileInformationWidget(), routeSettings: routeSettings);
      // case Routes.fqs:
      //   return buildPageRoute(
      //       child: BlocProvider<FaqCubit>(
      //         create: (context) => ServiceLocator().getIt<FaqCubit>()..getFAQ(),
      //         child: FAQSScreen(),
      //       ),
      //       routeSettings: routeSettings);
      //
      // // case Routes.searchingRoute:
      // //   return buildPageRoute(
      // //       child: SearchingScreen(), routeSettings: routeSettings);
    }
    return buildPageRoute(
        child: const Center(
          child: Text("no route found"),
        ),
        routeSettings: routeSettings);
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    RouteSettings? routeSettings,
  }) {
    pageRouteAnimation = pageRouteAnimation ?? PageRouteAnimation.Scale;
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.Fade) {
        return PageRouteBuilder(
          settings: routeSettings,
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
          reverseTransitionDuration: const Duration(milliseconds: 50),
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return RotationTransition(
                child: child, turns: ReverseAnimation(anim));
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return ScaleTransition(child: child, scale: anim);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      }
    }
    return MaterialPageRoute<T>(
      builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Directionality(
              textDirection: context.read<LanguageCubit>().isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child)),
      settings: routeSettings,
    );
  }
}
