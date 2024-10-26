import '../export/export.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.boxShadow,
      this.padding,
      this.margin,  this.alignment,
      this.borderWidth,
      this.borderColor,
      this.gradient,
      this.radiusDirectional,
      this.backgroundColor,
      this.child});
  final double? height;
  final double? width;
  final double? radius;
  final List<BoxShadow>? boxShadow;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget? child;
  final Gradient? gradient;
  final EdgeInsetsDirectional? padding;
  final  AlignmentDirectional? alignment;
  final EdgeInsetsDirectional? margin;
  final BorderRadiusDirectional? radiusDirectional;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,alignment: alignment,
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          border: borderColor.isNotNull
              ? Border.all(color: borderColor!, width: borderWidth!)
              : null,
          gradient: gradient,
          boxShadow: boxShadow,
          borderRadius:
              radiusDirectional ?? BorderRadius.circular(radius ?? 10.r)),
      child: child,
    );
  }
}
