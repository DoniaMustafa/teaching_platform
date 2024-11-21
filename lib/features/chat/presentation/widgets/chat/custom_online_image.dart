import '../../../../../core/export/export.dart';

class CustomOnlineImage extends StatelessWidget {
  const CustomOnlineImage(
      {super.key, required this.image, this.isAvailable = true});
  final String image;
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomNetworkImage.circular(
          imageUrl: image,
          defaultAsset: AppAssets().teacher,
          radius: 60.r,
          bordWidth: 1.5,
        ),
        if (isAvailable.isTrue)
          CustomCircleWidget(
            width: 16.w,
            borderWidth: 2,
            height: 16.h,
            radius: 10.r,
            color: AppColors.green,
            borderColor: AppColors.white,
          )
      ],
    );
  }
}
