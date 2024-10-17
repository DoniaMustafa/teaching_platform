import '../export/export.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key,this.radius=0, this.color, this.height, this.width});
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.h,
      width: width ?? 100.w,

      decoration: BoxDecoration(
          color: color ?? AppColors.darkMainAppColor,
          borderRadius: BorderRadius.circular(radius!)),
    );
  }
}
