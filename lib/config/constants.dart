// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tripia_driver/core/app_export/app_export.dart';

// final GlobalKey<NavigatorState> navigatorKeyState = GlobalKey<NavigatorState>();
// get getContext => navigatorKeyState.currentState?.context;

/*Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;*/
// const String apiGoogle='AIzaSyCeqfLXwLMUQs4CthXrETuanYwYxDpTM0k';
// double textBoldSizeGlobal = 16;
// double textPrimarySizeGlobal = 16;
// double textSecondarySizeGlobal = 14;
// String? fontFamilyBoldGlobal;
// String? fontFamilyPrimaryGlobal;
// String? fontFamilySecondaryGlobal;
// FontWeight fontWeightBoldGlobal = FontWeight.bold;
// FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
// FontWeight fontWeightSecondaryGlobal = FontWeight.normal;
//
// Color appBarBackgroundColorGlobal = Colors.white;
// Color appButtonBackgroundColorGlobal = Colors.white;
// //Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
// double defaultAppButtonRadius = 8.0;
// double defaultAppButtonElevation = 4.0;
// bool enableAppButtonScaleAnimationGlobal = true;
// int? appButtonScaleAnimationDurationGlobal;
// ShapeBorder? defaultAppButtonShapeBorder;
//
// Color defaultLoaderBgColorGlobal = Colors.white;
// Color? defaultLoaderAccentColorGlobal;
//
// Color? defaultInkWellSplashColor;
// Color? defaultInkWellHoverColor;
// Color? defaultInkWellHighlightColor;
// double? defaultInkWellRadius;
//
// Color shadowColorGlobal = Colors.grey.withOpacity(0.2);
// int defaultElevation = 4;
// double defaultRadius = 8.0;
// double defaultBlurRadius = 4.0;
// double defaultSpreadRadius = 1.0;
// double defaultAppBarElevation = 4.0;
//
// double? maxScreenWidth;
//
// double tabletBreakpointGlobal = 600.0;
// double desktopBreakpointGlobal = 720.0;
//
// int passwordLengthGlobal = 6;
//
class AppConstants {
  static const String egyptDialCode = "+20";
  static int maxYears = 20;
  static double defaultElevation = 4;
  static const String empty = '';
  // static BottomSheetShow state = BottomSheetShow.accept;
  static const double circleRadius = 10;
  static const dialogLongDuration = 2500;
  static const dialogShortDuration = 2000;
  static const int one = 1;
  static const int otpLength = 4;
  static int nShimmerItems = 10;
  static int shimmerItems = 4;
  static String dateTimeFormat = "yyyy-MM-dd";

  static const longDuration = 2500;
  static const shortDuration = 2000;

  static int passwordLength = 8;
  static int identityLength = 14;

  static const int zero = 0;
  // static LatLng egyptLatLng = const LatLng(30.033333, 31.233334);

  // static showCustomBottomSheet({
  //   required GlobalKey<ScaffoldState> scaffoldKey,
  //   required Widget content,
  // }) {
  //   scaffoldKey.currentState!.showBottomSheet(
  //       (context) => Container(color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 20), child: content));
  // }

  // static void showErrorDialog({required BuildContext context, required String msg}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => CupertinoAlertDialog(
  //             title: Text(
  //               msg,
  //               style: const TextStyle(color: Colors.black, fontSize: 16),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
  //                 child: const Text('Ok'),
  //               )
  //             ],
  //           ));
  // }
}
