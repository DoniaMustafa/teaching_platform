import '../../../../core/export/export.dart';

class CustomOnlineImage extends StatelessWidget {
  const CustomOnlineImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomNetworkImage.circular(
          imageUrl: 'imageUrl',
          radius: 60.r,
        ),
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
