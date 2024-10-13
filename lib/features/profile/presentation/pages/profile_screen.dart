import '../../../../core/export/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().profile.trans,
          widget: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: getPadding(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.vs,
                  Align(
                    alignment: AlignmentDirectional.centerEnd,

                    child: Padding(
                      padding: getPadding(end: 10.w,top: 10.h),
                      child: CustomTextWidget(
                        text: 'تعديل',
                        style: getRegularTextStyle(
                            fontFamily: FontFamilies.outfitFamily,
                            fontSize: 16,color: AppColors.mainAppColor),
                      ),
                    ),
                  ),
                  10.vs,
                  Align(
                   alignment: AlignmentDirectional.center,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CustomNetworkImage.circular(
                          imageUrl:
                              '${EndPoints.url}${AppPrefs.user!.profilePicture}',
                          radius: 80.r,
                        ),
                        CustomCircleWidget(
                          radius: 25.r,
                          alignment: AlignmentDirectional.center,
                          width: 25.w,
                          height: 25.h,
                          padding: getPadding(all: 0),
                          color: AppColors.white,
                          child: const CustomIcon(
                            size: 15,
                            icon: Icons.camera_alt,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.vs,
                  CustomTextWidget(
                    text: AppPrefs.user!.name!,
                    style: getBoldTextStyle(fontSize: 20),
                  ),
                  20.vs,
                  buildProfileInput(
                      title: AppStrings().emailHint.trans,
                      input: AppPrefs.user!.email ?? '@gmail.com',
                      icon: Icons.email),
                  10.vs,
                  buildProfileInput(
                      title: AppStrings().phone.trans,
                      input: AppPrefs.user!.phoneNumber!,
                      icon: Icons.phone_android),
                  10.vs,
                  buildProfileInput(
                      title: 'الرقم القومي',
                      input: '256666666666666',
                      icon: Icons.person),
                  10.vs,
                  buildProfileInput(
                    title: 'السنه الدراسية',
                    input: 'الصف الاول',
                  ),
                  10.vs,
                  buildProfileInput(
                    title: 'انوع التعليم',
                    input: 'عربي',
                  ),
                  10.vs,
                  CustomTextWidget(
                    text: 'كلمة المرور',
                    style: getSemiboldTextStyle(
                        fontSize: 16, color: AppColors.black.withOpacity(0.67)),
                  ),
                  10.vs,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: CustomTextWidget(
                      text: 'تغيير كلمة المرور',
                      style: getBoldTextStyle(
                          fontSize: 12, color: AppColors.mainAppColor),
                    ),
                  ),
                  10.vs,
                  Row(
                    children: [
                      CustomIcon(
                        icon: Icons.share,
                        size: 15,
                      ),3.hs,
                      CustomTextWidget(
                        text: 'كود المشاركة',
                        style: getSemiboldTextStyle(
                            fontSize: 16, color: AppColors.black.withOpacity(0.67)),
                      ),
                    ],
                  ),
                  5.vs,
                  Row(
                    children: [
                      CustomTextWidget(
                        text: 'https://www.google.com/',
                        style: getSemiboldTextStyle(
                            fontSize: 16,
                            color: AppColors.black.withOpacity(0.67)),
                      ),
                      20.hs,
                      CustomIcon(
                        icon: Icons.copy,
                        size: 15,
                      )
                    ],
                  ),
                  10.vs,
                  CustomTextWidget(
                    text: 'شارك الكود علي الموقع',
                    style: getSemiboldTextStyle(
                        fontSize: 16,
                        color: AppColors.black.withOpacity(0.67)),
                  ),
                  30.vs,
                  CustomElevatedButton(onPressed: (){}, text: AppStrings().logout.trans,),
                  10.vs,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: CustomTextWidget(
                      text: 'حذف الحساب',
                      style: getBoldTextStyle(
                          fontSize: 14,
                          color: AppColors.red,fontFamily: FontFamilies.outfitFamily),
                    ),
                  ),
                  10.vs,
                ],
              ),
            ),
          ),
        ));
  }

  buildProfileInput(
          {required String title, IconData? icon, required String input}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title,
            style: getSemiboldTextStyle(
                fontSize: 16, color: AppColors.black.withOpacity(0.67)),
          ),
          10.vs,
          CustomCard(
            borderWidth: 1,
            borderColor: AppColors.secondBorderColor,
            padding: getPadding(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                if (icon.isNotNull)
                  CustomIcon(
                    icon: icon,
                    size: 15,
                  ),
                10.hs,
                CustomTextWidget(
                  text: input,
                  style: getRegularTextStyle(fontSize: 16),
                )
              ],
            ),
          )
        ],
      );
}
