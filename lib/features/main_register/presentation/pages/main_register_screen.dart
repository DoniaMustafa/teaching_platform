import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/utils/app_strings.dart';

import '../../../../config/localization_constants.dart';

class MainRegisterScreen extends StatefulWidget {
  const MainRegisterScreen({super.key});

  @override
  State<MainRegisterScreen> createState() => _MainRegisterScreenState();
}

class _MainRegisterScreenState extends State<MainRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // _buildLang,
                _buildLanguage,
                24.vs,
                CustomTextWidget(
                  text: AppStrings().welcome.trans,
                  style: getBoldTextStyle(
                      fontSize: 36,
                      color: AppColors.mainAppColor,
                      height: 1,
                      fontFamily: FontFamilies.elMessiriFamily),
                ),
                CustomTextWidget(
                  text: AppStrings().appName,
                  style: getBoldTextStyle(
                      fontSize: 36,
                      color: AppColors.mainAppColor,
                      fontFamily: FontFamilies.elMessiriFamily),
                ),
                CustomNetworkImage.rectangle(
                  imageUrl: AppAssets().mainImage,
                  height: 330.h,
                  width: 337.w,
                ),
                40.vs,
                _buildRegisterButton,
              ],
            );
          },
        ),
      ),
    );
  }

  get _buildLanguage => Align(
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: getPadding(start: 20.w, top: 20.h),
          child: SizedBox(
            width: 150.w,
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
                          context
                              .setLocale(AppLocalizationsConstants().arLocale);
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
                          context
                              .setLocale(AppLocalizationsConstants().enLocale);
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

  get _buildRegisterButton => Padding(
        padding: getPadding(start: 33, end: 21),
        child: Column(
          children: [
            CustomElevatedButton(
              onPressed: () => Routes.loginRoute.moveTo,
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4))
              ],
              text: AppStrings().login.trans,
              color: AppColors.darkPrimaryColor,
            ),
            20.vs,
            CustomElevatedButton(
              onPressed: () => Routes.chooseRoleRoute.moveTo,
              text: AppStrings().createAccount.trans,
              isBorder: true,
              borderColor: AppColors.borderColor,
            ),
            20.vs,
            CustomElevatedButton(
              onPressed: () {},
              text: AppStrings().visitor.trans,
              textColor: AppColors.darkPrimaryColor,
              isBorder: true,
              color: AppColors.transparent,
              borderColor: AppColors.darkPrimaryColor,
            ),
            // 40.vs,
          ],
        ),
      );
}
