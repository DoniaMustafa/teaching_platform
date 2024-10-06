import '../../../../core/export/export.dart';

class BuildScheduleItem extends StatelessWidget {
  const BuildScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: CustomCard(
        boxShadow: [
          BoxShadow(
              color: AppColors.borderColor2.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0.2, 0.5))
        ],
        margin: getMargin(horizontal: 10.w, top: 30.h, bottom: 20.h),
        radius: 10.r,
        borderColor: AppColors.borderColor2,
        borderWidth: 0.5,
        padding: getPadding(start: 15.w, end: 20.w, vertical: 20.h),
        child: Row(
          children: [
            CustomTextWidget(
              text: AppStrings().schedule.trans,
              style: getRegularTextStyle(
                height: 1,
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            CustomTextWidget(
              text: ' الاربعاء 10/05/1236 ',
              style: getRegularTextStyle(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            const CustomIcon(
              icon: Icons.date_range,
              size: 18,
              color: AppColors.black,
            )
          ],
        ),
      ),
    );
  }
}
