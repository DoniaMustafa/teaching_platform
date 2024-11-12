import '../../../../core/export/export.dart';

class BuildNews extends StatelessWidget {
  const BuildNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: CustomListView(
        axisDirection: Axis.horizontal,
        separatorWidget: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemCount: AppListsConstant.listOfStudentCategories.length,
        widget: (context, index) => CustomNetworkImage.circular(
          imageUrl: AppAssets().newsIcon,
          defaultAsset: AppAssets().newsIcon,
          radius: 65.r,
        ),
      ),
    );
  }
}
