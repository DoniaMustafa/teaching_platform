import 'package:fluttertoast/fluttertoast.dart';
import 'package:teaching/core/enum_service.dart';
import 'package:teaching/core/export/export.dart';

import '../enums.dart';

class ToastHelper {
  // ToastHelper._();
  static void buildToast({
    required String text,
    required ToastColors tColor,
  }) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          backgroundColor: EnumService.setToastColor(tColor),
          textColor: AppColors.white,
          fontSize: 16.0);
}
