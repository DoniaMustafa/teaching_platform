import 'package:easy_localization/easy_localization.dart';

import '../../../../config/localization_constants.dart';
import '../../../../core/export/export.dart';

class BuildLanguage extends StatelessWidget {
  const BuildLanguage({super.key, this.padding});
  final EdgeInsetsDirectional? padding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        padding: padding,
        child: SizedBox(
          width: 180.w,
          child: PopupMenuButton(
              color: AppColors.white,
              position: PopupMenuPosition.under,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSvg(
                    asset: AppAssets().language,
                    color: AppColors.mainAppColor,
                  ),
                  9.hs,
                  CustomTextWidget(
                    text: context.read<LanguageCubit>().isEn
                        ? AppStrings().en.trans
                        : AppStrings().ar.trans,
                    style: getMediumTextStyle(
                      fontFamily: FontFamilies.interFamily,
                      fontSize: 16,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                ],
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        context.setLocale(AppLocalizationsConstants().arLocale);
                        context.read<LanguageCubit>().toArabic();
                        // context.read<LanguageCubit>().getSavedLanguage();
                      },
                      child: CustomTextWidget(
                        text: AppStrings().arabic.trans,
                        style: getMediumTextStyle(
                          fontFamily: FontFamilies.interFamily,
                          fontSize: 16,
                          color: AppColors.darkMainAppColor,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        context.setLocale(AppLocalizationsConstants().enLocale);
                        context.read<LanguageCubit>().toEnglish();
                        // context.read<LanguageCubit>().getSavedLanguage();
                      },
                      child: CustomTextWidget(
                        text: AppStrings().english.trans,
                        style: getMediumTextStyle(
                          fontFamily: FontFamilies.interFamily,
                          fontSize: 16,
                          color: AppColors.darkMainAppColor,
                        ),
                      ),
                    )
                  ]),
        ),
      ),
    );
  }

  // buildPop(Color backgroundColor,){
  //   return
  // }
}
