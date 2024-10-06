import '../../../../core/export/export.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: 'wallet',
      widget: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.vs,
            CustomCard(
              padding: getPadding(horizontal: 20.w, vertical: 10),
              margin: getMargin(horizontal: 30.w),
              backgroundColor: AppColors.mainAppColor,
              child: Row(
                children: [
                  CustomTextWidget(
                    text: 'الرصيد الحالي',
                    style: getRegularTextStyle(
                        fontSize: 16, color: AppColors.white),
                  ),
                  Spacer(),
                  CustomTextWidget(
                    text: '5999.5',
                    style: getRegularTextStyle(
                        fontSize: 16, color: AppColors.white),
                  ),
                ],
              ),
            ),
            20.vs,
            CustomElevatedButton(
              onPressed: () {},
              color: AppColors.white,
              borderColor: AppColors.borderColor2,
              isBorder: true,
              radius: 10.r,
              text: 'اشحن الان',
              textColor: AppColors.mainAppColor,
              margin: getMargin(horizontal: 110.w),
            ),
            20.vs,
            Padding(
              padding: getPadding(start: 10.w, end: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageWidget(
                    asset: AppAssets().qrCode,
                  ),
                  15.hs,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'عنوان المحفظة',
                          style: getBoldTextStyle(
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.black.withOpacity(0.65)),
                        ),
                        CustomTextWidget(
                          text: '0487473737823',
                          style: getBoldTextStyle(
                            fontSize: 20,
                          ),
                        ),
                        CustomTextWidget(
                          text:
                              'عنوان المحفظةيمكنك استلام رصيد من محفظة اخرى عن طريق عنوان المحفظة الخاصة بك',
                          // lines: 2,
                          style: getBoldTextStyle(
                              height: 1.3,
                              fontSize: 12,
                              color: AppColors.black.withOpacity(0.65)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.vs,
            CustomElevatedButton(
              onPressed: () {},
              color: AppColors.white,
              borderColor: AppColors.borderColor2,
              isBorder: true,
              radius: 10.r,
              text: 'تحويل الرصيد',
              textColor: AppColors.mainAppColor,
              margin: getMargin(horizontal: 100.w),
            ),
            15.vs,
            Padding(
              padding: getPadding(start: 10.w, end: 5.w),
              child: Row(
                children: [
                  10.hs,
                  CustomSvg(asset: AppAssets().transaction),
                  10.hs,
                  CustomTextWidget(
                    text: 'سجل المعاملات',
                    style: getBoldTextStyle(
                        fontSize: 20, color: AppColors.black.withOpacity(0.65)),
                  ),
                ],
              ),
            ),
            20.vs,
            _buildTransaction
          ],
        ),
      ),
    );
  }

  get _buildTransaction => CustomCard(
        backgroundColor: AppColors.white,
        radiusDirectional: BorderRadiusDirectional.only(
          topStart: Radius.circular(30.r),
          topEnd: Radius.circular(30.r),
        ),
        child: CustomListView(
            shrinkWrap: true,
            scroll: const NeverScrollableScrollPhysics(),
            separatorWidget: (context, index) => CustomDivider(
                  height: 1,
                  width: width,
                  color: AppColors.dividerColor,
                ),
            axisDirection: Axis.vertical,
            // shrinkWrap: true,
            itemCount: 5,
            widget: (context, index) => Padding(
                  padding: getPadding(start: 23.w, end: 19.w, vertical: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: 'كورس الفيزياء مع أ/محمود علي',
                          style: getSemiboldTextStyle(
                              fontSize: 14, color: AppColors.deepGray),
                        ),
                      ),
                      CustomTextWidget(
                        text: '150',
                        style: getRegularTextStyle(
                            fontSize: 18, color: AppColors.mainAppColor),
                      ),
                    ],
                  ),
                )),
      );
}
