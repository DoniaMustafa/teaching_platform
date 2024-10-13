import '../../../../core/export/export.dart';

class BuildMyFavorite extends StatelessWidget {
  const BuildMyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.favoriteRoutes.moveTo,
      child: CustomCard(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 4)
        ],
        padding: getPadding(vertical: 25.h, start: 20.w),
        child: Row(
          children: [
            const CustomIcon(
              icon: Icons.bookmark,
              color: AppColors.mainAppColor,
              size: 30,
            ),
            10.hs,
            CustomTextWidget(
              text: 'مرجعياتي',
              style: getSemiboldTextStyle(
                color: AppColors.subTitleColor,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
