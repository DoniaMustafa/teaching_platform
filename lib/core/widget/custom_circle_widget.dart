import 'package:teaching/core/utils/size_utils.dart';

import '../export/export.dart';

class CustomCircleWidget extends StatelessWidget {
  const CustomCircleWidget(
      {super.key,
      this.padding,
      this.height,
      this.width,
      this.child,
      this.color,
      this.borderColor,
      this.margin,
      this.alignment,
      this.radius});
  final EdgeInsetsDirectional? padding;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  final Color? color;
  final double? radius;
  final EdgeInsetsDirectional? margin;
  final AlignmentDirectional? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? getMargin(all: 0.w),
        padding: padding ?? getPadding(all: 10.w),
        height: height ?? 70.h,
        width: width ?? 70.w,
        alignment: alignment,
        decoration: BoxDecoration(
            color: color ?? AppColors.mainAppColor,
            borderRadius: BorderRadius.circular(radius ?? 40.h),
            border: Border.all(
                color: borderColor ?? AppColors.transparent, width: 1.w)),
        child: child);
  }
}
