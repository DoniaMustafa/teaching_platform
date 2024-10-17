import 'package:easy_localization/easy_localization.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/language/presentation/managers/language_oepration_cubit/language_oepration_cubit.dart';

import '../../../../config/localization_constants.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 100)
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: width,
      child: Column(
        children: [
          10.vs,
          CustomDivider(
            height: 6.h,
            radius: 10,
            width: 100.w,
            color: AppColors.profileDivider,
          ),
          10.vs,
          Text(
            AppStrings().changeLanguage.trans,
            style: getBoldTextStyle(
              fontSize: 16,
              fontFamily: FontFamilies.dubaiFamily,
            ),
          ),
          30.vs,
          Column(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: getPadding(bottom: 20),
                        child: _buildLanguageItem(
                          index: index,
                        ),
                      ))),
        ],
      ),
    );
  }

  Widget _buildLanguageItem({required int index}) =>
      BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return BlocBuilder<LanguageOperationCubit, LanguageOeprationState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  context.read<LanguageOperationCubit>().changeSelected(index);
                  switch (index) {
                    case 0:
                      context.setLocale(AppLocalizationsConstants().enLocale);

                      context.read<LanguageCubit>().toEnglish();
                      pop();
                    case 1:
                      context.setLocale(AppLocalizationsConstants().arLocale);
                      context.read<LanguageCubit>().toArabic();
                      pop();
                  }
                },
                child: CustomListTile(
                  isBorder:
                      index == context.read<LanguageOperationCubit>().selected
                          ? true
                          : false,
                  isDivider: false,
                  margin: getMargin(horizontal: 10),
                  padding: getPadding(horizontal: 15, vertical: 15),
                  borderColor:
                      index == context.read<LanguageOperationCubit>().selected
                          ? AppColors.mainAppColorOpacity
                          : AppColors.transparent,
                  r: 10.r,
                  title: index == 0
                      ? AppStrings().english.trans
                      : AppStrings().arabic.trans,
                  style: getSemiboldTextStyle(
                      fontSize: 16, color: AppColors.black),
                  widget:
                      index == context.read<LanguageOperationCubit>().selected
                          ? CustomCircleWidget(
                              radius: 25.r,
                              padding: getPadding(all: 0),
                              width: 25.w,
                              height: 25.h,
                              color: AppColors.mainAppColor,
                              child: const CustomIcon(
                                icon: Icons.check,
                                size: 17,
                                color: AppColors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
              );
            },
          );
        },
      );
}
