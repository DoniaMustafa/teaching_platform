// import 'package:easy_localization/easy_localization.dart';
// import 'package:tripia_driver/core/app_export/app_export.dart';
//
// import '../../../../config/localization_constants.dart';
// import '../../../../core/widgets/common/logo_with_title_and_subtitle.dart';
//
// class SelectLanguageScreen extends StatefulWidget {
//   SelectLanguageScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
// }
//
// class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomBackground(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           getLogoAndSubtitle,
//           72.87.vs,
//           _selectEnglishButton(context),
//           30.vs,
//           _selectArabicButton(context),
//           163.vs,
//         ],
//       ),
//     );
//   }
//
//   get getLogoAndSubtitle => LogoWithTitleAndSubtitle(
//         title: AppStrings().selectLanguage.tr(),
//       );
//
//   _selectEnglishButton(BuildContext context) => CustomElevatedButton(
//       text: AppStrings().english,
//       margin: getMargin(horizontal: 20),
//       padding: getPadding(vertical: 16),
//       onPressed: () async {
//         context.setLocale(AppLocalizationsConstants().enLocale);
//         BlocProvider.of<LanguageCubit>(context).toEnglish();
//         Routes.onBoardingRoute.moveToAndRemoveCurrent;
//       });
//   _selectArabicButton(BuildContext context) => CustomElevatedButton(
//       text: AppStrings().arabic,
//       margin: getMargin(horizontal: 20),
//       padding: getPadding(vertical: 16),
//       onPressed: () async {
//         context.setLocale(AppLocalizationsConstants().arLocale);
//         BlocProvider.of<LanguageCubit>(context).toArabic();
//         Routes.onBoardingRoute.moveToAndRemoveCurrent;
//       });
// }
