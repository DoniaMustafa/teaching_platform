import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';

class BuildWelcomeUser extends StatelessWidget {
  const BuildWelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: getPadding(
        horizontal: 20.w,
      ),
      backgroundColor: AppColors.lightPurple,
      padding: getPadding(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          const CustomIcon(
            icon: Icons.info,
            color: AppColors.black,
          ),
          10.hs,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextWidget(
                      textScalar: const TextScaler.linear(0.9),
                      text: '${AppStrings().welcomeTo.trans},',
                      style: getSemiboldTextStyle(
                          fontFamily: FontFamilies.abhayaLibreFamily,
                          fontSize: 18,
                          color: AppColors.mainAppColor),
                    ),
                    2.hs,
                    CustomTextWidget(
                      text: 'Yazen',
                      textScalar: const TextScaler.linear(0.9),
                      style: getBoldTextStyle(
                          fontFamily: FontFamilies.abhayaLibreFamily,
                          fontSize: 18,
                          color: AppColors.black),
                    ),
                    CustomTextWidget(
                      text: '👋',
                      style: getBoldTextStyle(
                          fontFamily: FontFamilies.abhayaLibreFamily,
                          fontSize: 16,
                          color: AppColors.black),
                    )
                  ],
                ),
                CustomTextWidget(
                  text: AppStrings().welcomeBack.trans,
                  style: getSemiboldTextStyle(
                      fontFamily: FontFamilies.abhayaLibreFamily,
                      fontSize: 18,
                      color: AppColors.mainAppColor),
                ),
              ],
            ),
          ),
          // if (RoleType.student.isTrue)
          CustomCard(
            backgroundColor: AppColors.mainAppColor,
            padding: getPadding(horizontal: 5.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomIcon(
                  icon: Icons.keyboard_arrow_down_outlined,
                  size: 15,
                  color: AppColors.white,
                ),
                // 10.hs,
                CustomTextWidget(
                  textScalar: const TextScaler.linear(0.9),
                  text: AppStrings().additionalCourses.trans,
                  style: getMediumTextStyle(
                      fontFamily: FontFamilies.abhayaLibreFamily,
                      fontSize: 14,
                      color: AppColors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
