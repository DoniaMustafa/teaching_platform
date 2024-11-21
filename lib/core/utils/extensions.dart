// import 'package:tripia_driver/core/app_export/app_export.dart';
//
// import 'package:inspection/inspection.dart';
//
// import '../../config/routes/app_routes_helper.dart';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:inspection/inspection.dart';
import 'package:teaching/core/export/export.dart';

extension StringExtension on String {
  String get trans => this.tr();
  String get removeSpaces => replaceAll(' ', '');
  int get codeFromString {
    String formattedStringColor = removeSpaces;
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6)
        ? formattedStringColor.addAtStart('FF')
        : formattedStringColor;
    return int.parse(formattedStringColor, radix: 16);
  }
//

  Color get colorFromString {
    String formattedStringColor = removeSpaces.toUpperCase();
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6)
        ? formattedStringColor.addAtStart('FF')
        : formattedStringColor;
    return Color(int.parse(formattedStringColor, radix: 16));
  }

  dynamic get fromStringToJson => jsonDecode(this);
  String get capitalize => toUpperCase();
//
  String addAtStart(String start) => "$start$this";
  bool isLengthEqual(int length) => this.length == length;
  int get toInt => int.parse(this);

//
//   /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => (isEmpty) || (this == 'null');

  bool get validateOtp {
    if (isNullOrEmpty || length < AppConstants.otpLength) {
      return false;
    }
    return true;
  }

  // String validate({String value = ''}) {
  //   if (isEmptyOrNull) {
  //     return value;
  //   } else {
  //     return this!;
  //   }
  // }
//
//   String? validatePassword(context) {
//     if (isEmpty ||
//       trim().isEmpty ||
//        length < AppConstants.passwordLength) {
//       return 'AppStrings().passwordError';
//     }
//     return null;
//   }
// //
//   String? validateConfirmPassword(context) {
//     if (isEmpty ||
//        trim().isEmpty ||
//        length <= AppConstants.passwordLength) {
//       return 'AppStrings().passwordError';
//     }
//     return null;
//   }
// //

// //
//   String? validateUserName(context) {
//     if (isEmpty) {
//       return 'AppStrings().userNameError';
//     }
//     return null;
//   }
//
//   String? validateUserComment(context) {
//     if (isEmpty) {
//       return AppStrings().useCommentError;
//     }
//     return null;
//   }

  // bool get validateRetypedPassword {
  //   if (this != validatePassword) {
  //     return false;
  //   }
  //   return true;
  // }

  bool get validateIdentity {
    if (isNullOrEmpty || this.length < AppConstants.identityLength) {
      return false;
    }
    return true;
  }

  // bool validateConfirmPassword(String? password) {
  //   if (validate == password) {
  //     return true;
  //   }
  //   return false;
  // }

//
//
//   bool isJson() {
//     try {
//       json.decode(validate());
//     } catch (e) {
//       return false;
//     }
//     return true;
//   }
//
//   isEqualTo(value) => this == value;
//   // isNotEqualTo(value) => this != value;
//   get getBack => pop();
//
  get moveToAndRemoveCurrent => pushRoute(this, isToReplace: true);
  moveToWithArgs(Map<String, dynamic> args) => pushRoute(this, arguments: args);
//
  get moveTo => pushRoute(this);
//
  get pushAndRemoveAllUntil => pushRoute(this, isNewTask: true);
//
  pushReplacementWithData(Map<String, dynamic>? arguments) =>
      pushRoute(this, isToReplace: true, arguments: arguments);

//   pushWithData(Map<String, dynamic>? arguments) =>
//       pushRoute(this, arguments: arguments);
//
//   pushAndRemoveAllWithDataUntil(Map<String, dynamic>? arguments) =>
//       pushRoute(this, isNewTask: true, arguments: arguments);
//   popScreen([Object? object]) => pop(object);
//   popScreenWithArgument([Object? object]) => pop(object);
//
//   //get moveToCurrrentRouteAndRemoveAllExceptHome => pushRoute(this, isNewTask: true, exceptRoute: Routes.home);
//   moveToCurrrentRouteAndRemoveAllExceptThisRoute() =>
//       pushRoute(this, isNewTask: true, exceptRoute: this);
//   get moveToCurrrentRouteAndRemoveAll => pushRoute(this, isNewTask: true);
//   get pushReplacement => pushRoute(this, isToReplace: true);
//   get push => pushRoute(this);
//
}

//
extension CutomMethodsOnNullObject on Object? {
  String get fromJsonToString => jsonEncode(this);
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNotNullAndIsFalse => this != null && this == false;
  bool get isNotNullAndIsTrue => this != null && this == true;
  bool get isNullOrIsFalse => this == null || this == true;
  bool get isNotNullOrFalse => this != null || this != true;

  bool get isTrue => this == true;
  bool get isFalse => this == false;
  Widget isNotNullGetWidget(Widget widget) =>
      isNotNull ? widget : const SizedBox.shrink();
}

//
// extension CutomMethodsOnObject on Object {
//   isEqualTo(value) => this == value;
//   isNotEqualTo(value) => this != value;
// }
//
extension StringNullExtension on String? {
  String get validate => this == null ? '' : this!;
  int get toInt => validate.isEmpty ? 0 : int.parse(this!);
//   double get toDouble => validate.isEmpty ? 0.0 : double.parse(this!);
  bool get isNotNull => this != null;
  bool get isNull => this == null;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get validateNetworkAsset {
    if (isNotNull && (this!.contains("http") || this!.contains("https"))) {
      return true;
    }
    return false;
  }

  // bool get isNotNullOrEmpty => this != null || this.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get validatePhone => Inspection()
          .inspect(this, 'required|numeric|min:2|max:11',
              message: AppStrings().phoneError.trans, name: this)
          .isNullOrEmpty
      ? true
      : false;
  bool get validateName => isNullOrEmpty ? false : true;
  bool get isEmail {
    const String emailRegex =
        '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(this!);
  }

  bool get validateEmail {
    if (isNullOrEmpty || !isEmail) {
      return false;
    }
    return true;
  }

  bool get validatePassword {
    if (isNullOrEmpty || this!.length < AppConstants.passwordLength) {
      return false;
    }
    return true;
  }

  bool validateConfirmPassword(String? password) {
    if (validate == password) {
      return true;
    }
    return false;
  }

//
// // String get tr => isNotNull ? AppLocalizations.tr(context)anslate(this!)! : "";
}

//
extension IntNullExtension on int? {
//   /// Validate given int is not null and returns given value if null.
//
  int get validate => this ?? 0;
//
//   /// Returns microseconds duration
//   /// 5.microseconds
  Duration get microseconds => Duration(microseconds: validate);
//
//   /// Returns milliseconds duration
//   /// ```dart
//   /// 5.milliseconds
//   /// ```
//
//   /// Returns seconds duration
//   /// ```dart
//   /// 5.seconds
//   /// ```
  Duration get seconds => Duration(seconds: validate);
//
//   /// Returns minutes duration
//   /// ```dart
//   /// 5.minutes
//   /// ```
//   Duration get minutes => Duration(minutes: validate);
//
//   /// Returns hours duration
//   /// ```dart
//   /// 5.hours
//   /// ```
//   Duration get hours => Duration(hours: this.validate);
//
//   /// Returns days duration
//   /// ```dart
//   /// 5.days
//   /// ```
//   Duration get days => Duration(days: validate);
  Duration get milliseconds => Duration(milliseconds: validate);
  SizedBox get vs => SizedBox(height: getVerticalSize(validate.toDouble()));
  SizedBox get hs => SizedBox(width: getHorizontalSize(validate.toDouble()));
//   EdgeInsetsDirectional get ph => getPadding(horizontal: validate.toDouble());
//   EdgeInsetsDirectional get pv => getPadding(vertical: validate.toDouble());
//   bool isSuccessful() => validate >= 200 && validate <= 206;
  double get h => getVerticalSize(validate.toDouble());
  double get w => getHorizontalSize(validate.toDouble());
  double get r => getVerticalSize(validate.toDouble());
//   int get toPositive => validate < 0 ? validate * -1 : validate;
}

//
// extension BullBoolExtension on bool? {
//   /* null false , false false */
//   bool get validate => this == null ? false : this!;
// }
//
// extension BoolExtension on bool {
//   /* null false , false false */
//   bool get isFalse => this == false;
//   bool get isTrue => this == true;
// }
//
// extension ListExtension on List<dynamic>? {
//   List<dynamic> get validate => this == null ? [] : this!;
// }
//
// /* json decode and encode*/
// extension MapExtension on Map<String, dynamic> {}
//
// extension DateTimeExtension on DateTime? {
//   /*validate*/
//   /* string to date time */
//   /* formate */
// }
//
extension DynamicExtension on dynamic {
  Map<String, dynamic> get json => jsonDecode(this);
  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
}

//
extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

//
extension DoubleExtension on double {
  double get h => getVerticalSize(this);
  double get w => getHorizontalSize(this);
  double get r => getVerticalSize(this);

  SizedBox get vs => SizedBox(height: h);
  SizedBox get hs => SizedBox(width: w);
}

extension BullBoolExtension on bool? {
  /* null false , false false */
  bool get orFalse => this == null ? false : this!;
  bool get orTrue => this == null ? true : this!;
}

extension BoolExtension on bool {
  /* null false , false false */
  bool get isFalse => this == false;
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNotNullAndIsFalse => this != null && this == false;
  bool get isNotNullAndIsTrue => this != null && this == true;
  bool get isNullOrIsFalse => this == null || this == true;
  bool get isNotNullOrFalse => this != null || this != true;
  bool get isNotFalse => this != false;
  bool get isNotTrue => this != true;
  bool get isTrue => this == true;
  Widget isNotNullGetWidget(Widget widget) =>
      isNotNull ? widget : const SizedBox.shrink();

  Widget isTrueGetWidget(Widget widget) =>
      isTrue ? widget : const SizedBox.shrink();
  Widget? isTrueGetWidgetOrAnotherWidget(Widget widget1, Widget widget2) =>
      isTrue ? widget1 : widget2;
}
