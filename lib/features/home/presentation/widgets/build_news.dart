import '../../../../core/export/export.dart';

class BuildNews extends StatelessWidget {
  const BuildNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: CustomListView(
        axisDirection: Axis.horizontal,
        separatorWidget: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemCount: AppListsConstant.listOfStudentCategories.length,
        widget: (context, index) => CustomCircleWidget(
            padding: getPadding(all: 2.5),
            borderColor: AppColors.green,
            borderWidth: 3,
            height: 63.h,
            color: AppColors.transparent,
            child: CustomImageWidget(
              asset: AppAssets().newsIcon,
            )),
      ),
      // ),
    );
  }
}
// CustomNetworkImage.circular(
// bordWidth: 4,
// imageUrl: 'AppAssets().newsIcon',
// defaultAsset: 'AppAssets().newsIcon',
// radius: 65.r,
