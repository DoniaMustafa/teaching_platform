import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:teaching/config/localization_constants.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/language/presentation/managers/language_cubit/language_cubit.dart';

class CustomEasyLocalization extends StatelessWidget {
  final Widget child;

  const CustomEasyLocalization({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocalizationsConstants().supportedLocales,
      path: AppLocalizationsConstants().path,
      // <-- change the path of the translation files
      fallbackLocale: AppLocalizationsConstants().arLocale,
      saveLocale: true,
      startLocale: AppLocalizationsConstants().enLocale,
      child: child,
    );
  }
}
