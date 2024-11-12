import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/utils/app_strings.dart';
import 'package:teaching/core/widget/common_widgets/custom_popup_menu.dart';
import 'package:teaching/features/main_register/presentation/widgets/build_language.dart';

import '../../../../config/localization_constants.dart';

class MainRegisterScreen extends StatefulWidget {
  const MainRegisterScreen({super.key});

  @override
  State<MainRegisterScreen> createState() => _MainRegisterScreenState();
}

class _MainRegisterScreenState extends State<MainRegisterScreen> {
  List items = [AppStrings().en.trans, AppStrings().ar.trans];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      statusBarColor: AppColors.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLanguage(),
                // BuildLanguage(
                //   padding: getPadding(top: 20, start: 20),
                // ),
                24.vs,
                CustomTextWidget(
                  text: AppStrings().welcomeTo.trans,
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
                _buildRegistrationButtons,
              ],
            );
          },
        ),
      ),
    );
  }

  get _buildRegistrationButtons => Padding(
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
                    offset: const Offset(0, 4))
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

  Widget _buildLanguage() => CustomPopupMenu(
        items: items,
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
        onTap: (int index) {
          switch (index) {
            case 0:
              context.setLocale(AppLocalizationsConstants().enLocale);
              context.read<LanguageCubit>().toEnglish();
              break;
            case 1:
              context.setLocale(AppLocalizationsConstants().arLocale);
              context.read<LanguageCubit>().toArabic();
              // setState(() {
              // });
              break;
          }
        },
      );
}
