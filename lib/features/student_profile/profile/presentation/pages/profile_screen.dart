import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/student_profile/profile/presentation/sevice.dart';

mixin InputProfileData {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController eduType = TextEditingController();
  TextEditingController gradeType = TextEditingController();
  TextEditingController nationalId = TextEditingController();
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with InputProfileData {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = AppPrefs.user!.name!;
    email.text = AppPrefs.user!.email ?? '@gmail.com';
    phone.text = AppPrefs.user!.phoneNumber ?? '00000000000';
    country.text = AppPrefs.user!.countryName ?? '00000000000';
    eduType.text = AppPrefs.user!.educationTypeName ?? 'education Type';
    gradeType.text = AppPrefs.user!.programTypeName ?? 'grade Type';
    gradeType.text = AppPrefs.user!.nationalId ?? '00000000000';
  }

  @override
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    AppPrefs.user!.image;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      showBack: true,
      showTitle: true,
      showAppbar: true,
      widget: CustomTextWidget(
        align: TextAlign.center,
        text: AppStrings().profile.trans,
        style: getBoldTextStyle(fontSize: 18),
      ),
      // backgroundColor: AppColors.white,
      statusBarColor: AppColors.mainAppColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: getPadding(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vs,
              GestureDetector(
                onTap: () => Routes.updateUserProfileRoute.moveTo,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: getPadding(end: 10.w, top: 10.h),
                    child: CustomTextWidget(
                      text: AppStrings().editAccount.trans,
                      style: getRegularTextStyle(
                          fontFamily: FontFamilies.outfitFamily,
                          fontSize: 16,
                          color: AppColors.mainAppColor),
                    ),
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
                      imageUrl: '${EndPoints.url}${AppPrefs.user!.image}',
                      radius: 80.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        showChangeImageBottomSheet(context);
                      },
                      child: CustomCircleWidget(
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
                    ),
                  ],
                ),
              ),
              30.vs,
              buildProfileInput(
                  title: AppStrings().userNameHint.trans,
                  input: name,
                  icon: Icons.person),
              15.vs,
              buildProfileInput(
                  title: AppStrings().phone.trans,
                  input: phone,
                  icon: Icons.phone_android),
              15.vs,
              buildProfileInput(
                  title: AppStrings().emailHint.trans,
                  input: email,
                  icon: Icons.email),
              buildProfileInput(
                  title: AppStrings().country.trans,
                  input: country,
                  icon: Icons.location_city),

              // Row(
              //
              //   children: List.generate(3, (index)=> Expanded(child: buildProfileInput(
              //       title: AppStrings().emailHint.trans,
              //       input: email,
              //       icon: Icons.email)),),
              // ),
              buildProfileInput(
                  title: 'الرقم القومي', input: nationalId, icon: Icons.person),
              10.vs,
              if (AppPrefs.userRole == "1")
                buildProfileInput(
                  title: AppStrings().eduType.trans,
                  input: eduType,
                ),
              if (AppPrefs.userRole == "1") 10.vs,
              if (AppPrefs.userRole == "1")
                buildProfileInput(
                  title: AppStrings().groupType.trans,
                  input: gradeType,
                ),

              20.vs,
              Row(
                children: [
                  const CustomIcon(
                    icon: Icons.share,
                    size: 15,
                  ),
                  3.hs,
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
                        fontSize: 16, color: AppColors.black.withOpacity(0.67)),
                  ),
                  20.hs,
                  const CustomIcon(
                    icon: Icons.copy,
                    size: 15,
                  )
                ],
              ),
              10.vs,
              CustomTextWidget(
                text: 'شارك الكود علي الموقع',
                style: getSemiboldTextStyle(
                    fontSize: 16, color: AppColors.black.withOpacity(0.67)),
              ),
              30.vs,

              Align(
                alignment: AlignmentDirectional.center,
                child: CustomTextWidget(
                  text: 'حذف الحساب',
                  style: getBoldTextStyle(
                      fontSize: 14,
                      color: AppColors.red,
                      fontFamily: FontFamilies.outfitFamily),
                ),
              ),

              10.vs,
            ],
          ),
        ),
      ),
    );
  }

  buildProfileInput(
          {required String title,
          IconData? icon,
          required TextEditingController input}) =>
      CustomTextFormField(
        label: title,
        controller: input,
        enabled: false,
      );
}
