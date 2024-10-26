import 'package:teaching/features/favorite/presentation/manager/favorite_video_courses_cubit.dart';
import 'package:teaching/features/favorite/presentation/manager/favorite_video_groups_cubit.dart';

import '../../../../core/export/export.dart';
import '../../../favorite/presentation/pages/favorite_screen.dart';

class BuildMyFavorite extends StatelessWidget {
  const BuildMyFavorite({super.key, required this.whichScreen});
  final String whichScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(whichScreen);
        whichScreen == AppStrings().subscribeCourseDetails
            ? context
                .read<FavoriteVideoCoursesCubit>()
                .getFavoriteVideoCourses()
            : context.read<FavoriteVideoGroupsCubit>().getFavoriteVideoGroups();
        Routes.favoriteCourseVideoRoute
            .moveToWithArgs({FavoriteScreen.whichScreenKey: whichScreen});
      },
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
