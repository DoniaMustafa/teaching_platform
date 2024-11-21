import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_popup_menu.dart';
import 'package:teaching/features/home/presentation/manager/home_operation_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/build_user_drop_down.dart';

class BuildWelcomeUser extends StatelessWidget {
  BuildWelcomeUser({super.key});

  String? firstName;
  @override
  Widget build(BuildContext context) {
    if (AppPrefs.userRole == "1" || AppPrefs.userRole == "3") {
      List<String>? nameParts = AppPrefs.user!.name!.split(' ');
      firstName = nameParts[0];
    }

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
              child: CustomNetworkImage.circular(
                imageUrl: '${EndPoints.url}${AppPrefs.user!.image}',
                radius: 50.r,
              )),
          10.hs,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextWidget(
                      textScalar: const TextScaler.linear(0.85),
                      text: '${AppStrings().hello.trans},',
                      style: getSemiboldTextStyle(
                          fontFamily: FontFamilies.abhayaLibreFamily,
                          fontSize: 18,
                          color: AppColors.mainAppColor),
                    ),
                    2.hs,
                    CustomTextWidget(
                      text: AppPrefs.userRole == "1" || AppPrefs.userRole == "3"
                          ? firstName!
                          : "",
                      textScalar: const TextScaler.linear(0.85),
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
                  textScalar: const TextScaler.linear(0.85),
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
      items: AppListsConstant().user,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 9.hs,
          BlocBuilder<HomeOperationCubit, CubitStates>(
            builder: (context, state) {
              return CustomTextWidget(
                text: context.read<HomeOperationCubit>().selected.isNull
                    ? AppListsConstant().user[0].title!
                    : context.read<HomeOperationCubit>().selected!,
                textScalar: const TextScaler.linear(0.9),
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
          .onChangeItem(AppListsConstant().user[index].title!,
              AppListsConstant().user[index].id!),
    );
  }
}
