import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/helper/custom_bootom_sheet.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/language/presentation/screens/change_language_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  List<String> settings = [];
  @override
  Widget build(BuildContext context) {
    settings = [
      AppStrings().profile.trans,
      AppStrings().language.trans,
      AppStrings().changePassword.trans,
      AppStrings().aboutUs.trans,
      AppStrings().privacyPolice.trans,
      AppStrings().termsAndConditions.trans,
      AppStrings().logout.trans,
    ];
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().settings.trans,
        widget: Padding(
          padding: getPadding(horizontal: 15.w),
          child: Column(
            children: [
              20.vs,
              CustomListTile(
                color: AppColors.transparent,
                isBorder: true,
                padding: getPadding(horizontal: 10.w, vertical: 15.h),
                isDivider: false,
                title: 'Yezan',
                subtitle: '010100111',
                image: AppAssets().teacher,
                widget: CustomCard(
                  padding: getPadding(all: 5),
                  backgroundColor:
                      AppColors.mainAppColorOpacity.withOpacity(0.5),
                  child: const CustomIcon(
                    icon: Icons.edit_outlined,
                  ),
                ),
              ),
              20.vs,
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      settings.length,
                      (int index) => Padding(
                        padding: getPadding(vertical: 10.h),
                        child: Column(
                          children: [
                            if (index != 6)
                              _buildSettingItem(
                                  onTap: () => onTapItem(index, context),
                                  title: settings[index]),
                            if (index == 6) 100.vs,
                            if (index == 6)
                              CustomElevatedButton(
                                  onPressed: () =>
                                      context.read<UserCubit>().logout(),
                                  text: settings[index])
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required Function onTap,
  }) =>
      CustomListTile(
        onTap: () => onTap(),
        color: AppColors.transparent,
        isBorder: true,
        r: 15.r,
        padding: getPadding(horizontal: 15.w, vertical: 18.h),
        isDivider: false,
        title: title,
        isIcon: true,
      );

  void onTapItem(int index, BuildContext context) {
    print(index);
    switch (index) {
      case 0:
        Routes.profileRoute.moveTo;
      case 1:
        CustomBottomSheet.showCustomBottomSheet(
            context: context,
            content: ChangeLanguageScreen(),
            padding: const EdgeInsetsDirectional.all(0));
      case 2:
        appearBottomSheet(context);

      case 3:
        Routes.aboutUsRoute.moveTo;
      case 4:
        Routes.privacyRoute.moveTo;
      case 5:
        Routes.termsAndConditionRoute.moveTo;
    }
  }

  void appearBottomSheet(context) {
    CustomBottomSheet.showCustomBottomSheet(
        context: context,
        content: Padding(
          padding: getPadding(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.vs,
                CustomDivider(
                  height: 6.h,
                  radius: 10,
                  width: 100.w,
                  color: AppColors.profileDivider,
                ),
                20.vs,
                Text(
                  AppStrings().changePassword.trans,
                  style: getBoldTextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilies.dubaiFamily,
                  ),
                ),
                40.vs,
                Form(
                    // key: finalKey,
                    child: Column(
                  children: [
                    PasswordWidget(
                      hintText: AppStrings().enterOldPassword.trans,
                      controller: TextEditingController(),
                    ),
                    20.vs,
                    PasswordWidget(
                      // isShadow: false,
                      // password: password,
                      controller: TextEditingController(),
                    ),
                    20.vs,
                    // ConfirmPasswordWidget(
                    //   confirmPasswordController: confirmPasswordController,
                    //   passwordController: passwordController,
                    // ),
                  ],
                )),
                30.vs,
                CustomElevatedButton(
                    onPressed: () {
                      // if (finalKey.currentState!.validate() &&
                      //     oldPasswordController.text.isNotEmpty &&
                      //     confirmPasswordController.text.isNotEmpty &&
                      //     passwordController.text.isNotEmpty) {
                      //   AppService()
                      //       .getBlocData<DriverCubit>()
                      //       .upatePersonalInfo(
                      //       driver: UpdateDriverInfoParamsModel(
                      //         currentPassword: oldPasswordController.text,
                      //         newPasswordConfirmation:
                      //         confirmPasswordController.text,
                      //         newPassword: passwordController.text,
                      //       ));
                      // }
                    },
                    text: AppStrings().changePassword.trans),
                20.vs,
              ],
            ),
          ),
        ),
        padding: getPadding(all: 0));
  }
}
