import '../../../../core/export/export.dart';

Drawer buildDrawer() => Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            40.vs,
            CustomNetworkImage.circular(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              radius: 100.r,
              defaultAsset: '',
            ),
            10.vs,
            CustomTextWidget(
              text: 'Amgad maged',
              style: getSemiboldTextStyle(
                  fontSize: 18, fontFamily: FontFamilies.interFamily),
            ),
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
          AppListsConstant.drawerItems.length,
          (index) => CustomCard(
              padding: getPadding(horizontal: 15.w, vertical: 12.h),
              child: Row(
                children: [
                  CustomImageWidget(
                    asset: AppAssets().drawer[index],
                    width: 25.w,
                    height: 25.h,
                  ),
                  10.hs,
                  CustomTextWidget(
                    text: AppListsConstant.drawerItems[index].title!,
                    style: getMediumTextStyle(
                        fontFamily: FontFamilies.interFamily, fontSize: 18),
                  ),
                  const Spacer(),
                  const CustomIcon(
                    icon: Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.softBlack,
                  )
                ],
              ))),
    );
