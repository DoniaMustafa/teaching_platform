// import 'package:easy_localization/easy_localization.dart';
// import 'package:tripia_driver/core/app_export/app_export.dart';
//
// import '../../../../config/localization_constants.dart';
//
// class ChangeLanguageScreen extends StatelessWidget {
//   ChangeLanguageScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.h,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 100)],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       width: MediaQuery.of(AppService.getContext).size.width,
//       child: Column(
//         children: [
//           Padding(
//             padding: getPadding(vertical: 20),
//             child: Container(
//               height: 10.h,
//               width: 110.w,
//               decoration: BoxDecoration(color: AppColors.separatorColor, borderRadius: BorderRadius.circular(20)),
//             ),
//           ),
//           Text(
//             AppStrings().languageApp.trans,
//             style: getBoldTextStyle(fontSize: 14, fontFamily: FontFamilies.almaraiFamily),
//           ),
//           30.vs,
//           Column(
//               children: List.generate(
//                   2,
//                   (index) => Padding(
//                         padding: getPadding(bottom: 20),
//                         child: _buildLanguageItem(
//                           index: index,
//                         ),
//                       )))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLanguageItem({required int index}) => BlocBuilder<LanguageOperationCubit, LanguageOeprationState>(
//         builder: (context, state) {
//           return GestureDetector(
//             onTap: () async {
//               context.read<LanguageOperationCubit>().changeSelected(index);
//               switch (index) {
//                 case 0:
//                   context.setLocale(AppLocalizationsConstants().enLocale);
//                   BlocProvider.of<LanguageCubit>(context).toEnglish();
//                   // await context.read<LanguageCubit>().toEnglish();
//                   // AppService().getBlocData<LanguageCubit>().getSavedLanguage();
//                   context.read<BottomNavOperationCubit>().changeIndex(3);
//                   Routes.bottomNavigationRoute.moveToAndRemoveCurrent;
//                 case 1:
//                   // await context.read<LanguageCubit>().toEnglish();
//                   // AppService().getBlocData<LanguageCubit>().getSavedLanguage();
//                   context.setLocale(AppLocalizationsConstants().arLocale);
//                   BlocProvider.of<LanguageCubit>(context).toArabic();
//
//                   context.read<BottomNavOperationCubit>().changeIndex(3);
//                   Routes.bottomNavigationRoute.moveToAndRemoveCurrent;
//               }
//             },
//             child: Container(
//               margin: getMargin(horizontal: 10),
//               padding: getPadding(horizontal: 15, vertical: 15),
//               decoration: BoxDecoration(
//                   color: AppColors.whiteCard,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   border: Border.all(
//                       color: index == context.read<LanguageOperationCubit>().selected
//                           ? AppColors.primaryColor
//                           : AppColors.transparent)),
//               child: Row(
//                 children: [
//                   index == 0 ? Image.asset(AppAssets().englishFlag) : Image.asset(AppAssets().arabicFlag),
//                   10.hs,
//                   Text(
//                     index == 0 ? AppStrings().english.trans : AppStrings().arabic.trans,
//                     style: getSemiboldTextStyle(color: AppColors.black),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
// }
