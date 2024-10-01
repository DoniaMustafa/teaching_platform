import '../export/export.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.height,  this.width});
final double? height;
final double? width;final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height??1.h,width: width??100.w,
      color:color?? AppColors.darkMainAppColor,
    );
  }
}
