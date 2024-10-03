



import 'dart:async';

import '../config/constants.dart';
import '../config/routes/app_routes_helper.dart';
import '../core/export/export.dart';
import '../core/widget/custom_dialog.dart';

class AppService {
  /// Factory method that reuse same instance automatically
  factory AppService() => Singleton.lazy(() => AppService._());

  /// Private constructor
  AppService._() {}



  // BehaviorSubject<int> homePageIndex = BehaviorSubject<int>();
  // BehaviorSubject<bool> refreshAssignedOrders = BehaviorSubject<bool>();
  // BehaviorSubject<bool> refreshWalletBalance = BehaviorSubject<bool>();
  // static AppLocalizations lan = Localizations.of<AppLocalizations>(getContext, AppLocalizations)!;
  // static AppLocalizations get lan =>
  //     Localizations.of<AppLocalizations>(getContext, AppLocalizations)!;
  // Lock lock = Lock();
  // changeHomePageIndex({int index = 2}) async {
  //   print("Changed Home Page");
  //   // homePageIndex.add(index);
  // }

  /// if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  // get getContext => navigatorKey.currentContext;
  // Future<T?> pushRoute<T>(
  //   String route, {
  //   bool isNewTask = false,
  //   bool isToReplace = false,
  //   String? exceptRoute,
  //   Map<String, dynamic>? arguments,
  // }) async {
  //   if (isNewTask) {
  //     return navigatorKey.currentState!.pushNamedAndRemoveUntil(
  //         route,
  //         exceptRoute.isNotNull
  //             ? ModalRoute.withName(exceptRoute!)
  //             : (route) => false,
  //         arguments: arguments);
  //   } else if (isToReplace) {
  //     return navigatorKey.currentState!
  //         .pushReplacementNamed(route, arguments: arguments);
  //   } else {
  //     return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  //   }
  // }
  //
  // /// Dispose current screens or close current dialog
  //
  // void pop([Object? object]) {
  //   if (Navigator.canPop(getContext)) Navigator.pop(getContext, object);
  // }
  //
  // Future showCustomDialog({
  //   String? message,
  //   Widget? child,
  //   bool isAlert = true,
  //   AlertTypes dialogType = AlertTypes.loading,
  //   bool dismissible = false,
  // }) =>
  //     showDialog(
  //       context: getContext,
  //       barrierDismissible: dismissible,
  //       builder: (context) {
  //         return Directionality(
  //             textDirection: getBlocData<LanguageCubit>().isEn
  //                 ? TextDirection.ltr
  //                 : TextDirection.rtl,
  //             child: isAlert
  //                 ? AlertDialog(
  //                     content: child,
  //                   )
  //                 : CustomDialog(
  //                     message: message,
  //                     dialogType: dialogType,
  //                   ));
  //       },
  //     );
  // Future showCustomDialogWithTimer({
  //   String? message,
  //   bool dismissible = false,
  //   AlertTypes dialogType = AlertTypes.loading,
  //   DialogTimingTypes dialogTimingType = DialogTimingTypes.long,
  //   void Function()? onTimeOut,
  // }) async {
  //   if (_isThereCurrentDialogShowing(getContext).isTrue) {
  //     pop();
  //   }
  //   showCustomDialog(
  //       isAlert: false,
  //       message: message,
  //       dialogType: dialogType,
  //       dismissible: dismissible);
  //   Timer(
  //     Duration(
  //       milliseconds: dialogTimingType == DialogTimingTypes.long
  //           ? AppConstants.dialogLongDuration
  //           : AppConstants.dialogShortDuration,
  //     ),
  //     () {
  //       pop();
  //       if (onTimeOut.isNotNull) {
  //         onTimeOut!();
  //       }
  //     },
  //   );
  // }
  //
  // /* check whether Alert Dialog is open */
  // bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
  // /*hide keypad if it is shown*/
  get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();
  bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
  /*hide keypad if it is shown*/
  requestFocus(FocusNode focusNode) => FocusScope.of(getContext).requestFocus(focusNode);
  T getBlocData<T extends StateStreamableSource<Object?>>() => BlocProvider.of<T>(getContext);
  //
  // /// show child widget in dialog
  Future showCustomDialog({
    String? message,
    Widget? child,
    bool isAlert = true,
    AlertTypes dialogType = AlertTypes.loading,
    bool dismissible = false,
  }) =>
      showDialog(
        context: getContext,
        barrierDismissible: dismissible,
        builder: (context) {
          return isAlert
              ? AlertDialog(
            content: child,
          )
              : CustomDialog(
            message: message,
            dialogType: dialogType,
          );
        },
      );
  Future showCustomDialogWithTimer({
    String? message,
    bool dismissible = false,
    AlertTypes dialogType = AlertTypes.loading,
    DialogTimingTypes dialogTimingType = DialogTimingTypes.long,
    void Function()? onTimeOut,
  }) async {
    if (_isThereCurrentDialogShowing(getContext).isTrue) {
      pop();
    }
    showCustomDialog(isAlert: false, message: message, dialogType: dialogType, dismissible: dismissible);
    Timer(
      Duration(
        milliseconds:
        dialogTimingType == DialogTimingTypes.long ? AppConstants.dialogLongDuration : AppConstants.dialogShortDuration,
      ),
          () {
        pop();
        if (onTimeOut.isNotNull) {
          onTimeOut!();
        }
      },
    );
  }
  //
  // showToast({required String message, required AlertTypes alertType}) {
  //   toastification.show(
  //       showProgressBar: false,
  //       title: AutoSizeText(
  //         message,
  //         textAlign: TextAlign.center,
  //         softWrap: true,
  //         style: getSemiboldTextStyle(fontSize: 12, color: AppColors.primaryColor),
  //       ),
  //       primaryColor: AppColors.primaryColor,
  //       borderRadius: BorderRadius.circular(19),
  //       alignment: Alignment.bottomCenter
  //     /*   child: Container(
  //       decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(19)),
  //       padding: getPadding(all: 17),
  //       child: Row(
  //         children: [
  //           Image.asset(
  //             AppAssets().tripiaLogo,
  //             height: 20.h,
  //             width: 20.w,
  //           ),
  //           10.hs,
  //           Expanded(
  //             child: AutoSizeText(
  //               message,
  //               textAlign: TextAlign.center,
  //               softWrap: true,
  //               style: getSemiboldTextStyle(fontSize: 12, color: AppColors.white),
  //             ),
  //           ),
  //           if (alertType == AlertTypes.warning)
  //             const Icon(
  //               Icons.error,
  //               size: 20,
  //               color: AppColors.white,
  //             ),
  //           if (alertType == AlertTypes.error)
  //             const Icon(
  //               Icons.clear,
  //               size: 20,
  //               color: AppColors.white,
  //             ),
  //         ],
  //       ),
  //     ),
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: const Duration(seconds: 3),*/
  //   );
  // }
}
