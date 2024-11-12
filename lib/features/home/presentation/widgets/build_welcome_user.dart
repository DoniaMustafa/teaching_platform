import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_popup_menu.dart';
import 'package:teaching/features/home/presentation/manager/home_operation_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/build_user_drop_down.dart';

class BuildWelcomeUser extends StatelessWidget {
  BuildWelcomeUser({super.key});

  List<String> user = [
    AppStrings().privetCourses.trans,
    AppStrings().additionalCourses.trans,
    AppStrings().professionalCourse.trans,
  ];
  String? firstName;
  @override
  Widget build(BuildContext context) {
    List<String>? nameParts = AppPrefs.user!.name!.split(' ');
    firstName = nameParts[0];

    return CustomCard(
      margin: getPadding(
        horizontal: 20.w,
      ),
      backgroundColor: AppColors.lightPurple,
      padding: getPadding(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Routes.profileRoute.moveTo,
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return CustomNetworkImage.circular(
                  imageUrl: '${EndPoints.url}${AppPrefs.user!.image}',
                  radius: 50.r,
                );
              },
            ),
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
                      text: '${AppStrings().hello.trans},',
                      style: getSemiboldTextStyle(
                          fontFamily: FontFamilies.abhayaLibreFamily,
                          fontSize: 18,
                          color: AppColors.mainAppColor),
                    ),
                    2.hs,
                    CustomTextWidget(
                      text: firstName!,
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
          if (AppPrefs.userRole == '1') _buildMenu()
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return CustomPopupMenu(
      backgroundColor: AppColors.mainAppColor,
      items: user,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 9.hs,
          BlocBuilder<HomeOperationCubit, CubitStates>(
            builder: (context, state) {
              return CustomTextWidget(
                text: context.read<HomeOperationCubit>().selected.isNull
                    ? user[0]
                    : context.read<HomeOperationCubit>().selected!,
                style: getMediumTextStyle(
                  fontFamily: FontFamilies.interFamily,
                  fontSize: 14,
                  color: AppColors.white,
                ),
              );
            },
          ),
          5.hs,
          const CustomIcon(
            icon: Icons.keyboard_arrow_down,
            color: AppColors.white,
          )
        ],
      ),
      onTap: (int index) => AppService()
          .getBlocData<HomeOperationCubit>()
          .onChangeItem(user[index]),
    );
  }
}
