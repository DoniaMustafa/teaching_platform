import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../../../../core/export/export.dart';

Drawer buildDrawer() => Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            40.vs,
            // CustomNetworkImage.circular(
            //   imageUrl: '${EndPoints.baseUrl}${AppService().getBlocData<UserCubit>().user!.profilePicture!}',
            //   radius: 100.r,
            //   defaultAsset: '',
            // ),
            10.vs,
            // CustomTextWidget(
            //   text: AppPrefs.user!.name!,
            //   style: getSemiboldTextStyle(
            //       fontSize: 18, fontFamily: FontFamilies.interFamily),
            // ),
            12.vs,
            CustomCard(
              child: CustomTextWidget(
                text: 'تبديل الحساب',
                style: getSemiboldTextStyle(
                    fontSize: 14, color: AppColors.selectedColor),
              ),
            ),
            30.vs,
            _buildItems
          ],
        ),
      ),
    );
get _buildItems => Column(
      children: List.generate(
          EnumService.userDrawerType(AppPrefs.user!.userRole!).length,
          (index) => GestureDetector(
                onTap: () =>
                    EnumService.userDrawerType(AppPrefs.user!.userRole!)[index]
                        .onTap!(),
                child: CustomCard(
                    padding: getPadding(horizontal: 15.w, vertical: 12.h),
                    child: Row(
                      children: [
                        // CustomImageWidget(
                        //
                        //   asset: AppAssets().drawer[index],
                        //   width: 25.w,
                        //   height: 25.h,
                        // ),
                        10.hs,
                        CustomTextWidget(
                          text: EnumService.userDrawerType(
                                  AppPrefs.user!.userRole!)[index]
                              .title!,
                          style: getMediumTextStyle(fontSize: 14),
                        ),
                        const Spacer(),
                        const CustomIcon(
                          icon: Icons.arrow_forward_ios,
                          size: 18,
                          color: AppColors.softBlack,
                        )
                      ],
                    )),
              )),
    );
