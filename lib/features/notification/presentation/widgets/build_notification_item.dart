import '../../../../core/export/export.dart';

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: CustomCard(
        // height: 100,
        margin: getMargin(horizontal: 10.w, vertical: 8.h),
        radius: 10.r,
        borderColor: AppColors.borderColor2,
        borderWidth: 0.5,
        padding: getPadding(horizontal: 10.w, vertical: 15.h),
        child: Row(
          children: [
            CustomNetworkImage.circular(
              imageUrl: AppAssets().student,
              radius: 50.r,
            ),
            10.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextWidget(
                        text: '10/05/1236 12:00 am',
                        style: getRegularTextStyle(
                          height: 1,
                          fontSize: 12,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      const Spacer(),
                      const CustomIcon(
                        icon: Icons.close,
                        size: 18,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  5.vs,
                  CustomTextWidget(
                    text:
                        'AppStrings().notificatinotificationTitlenotificationTitlenotificationTitlenotificationTitleonTitle.trans',
                    style: getRegularTextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
