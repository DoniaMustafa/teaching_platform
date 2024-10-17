import 'package:teaching/core/export/export.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  double? height;
  double? width;
  BoxShape? boxShape;
  double? radius;
  BorderRadiusDirectional? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  Color? baseColor;
  Color? highlightColor;
  CustomShimmer({
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    Key? key,
  }) : super(key: key);
  CustomShimmer.fromRectangle({
    super.key,
    this.height = 12,
    this.width = 20,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  }) : boxShape = BoxShape.rectangle;

  CustomShimmer.fromCircular({
    super.key,
    this.radius,
    this.baseColor,
    this.highlightColor,
  }) : boxShape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.mainAppColorOpacity,
      highlightColor: highlightColor ?? AppColors.mainAppColorOpacity.withOpacity(0.3),
      // direction: context.read<LanguageCubit>().isEn
      //     ? ShimmerDirection.ltr
      //     : ShimmerDirection.rtl,
      child: boxShape == BoxShape.rectangle
          ? Container(
              height: height,
              width: width,
              padding: padding,
              margin: margin,
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, // is used to clip the internal child widget of container when u define border radius,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: AppColors.mainAppColorOpacity.withOpacity(0.8),
                boxShadow: boxShadow,
              ),
            )
          : CircleAvatar(
              backgroundColor: AppColors.mainAppColorOpacity.withOpacity(0.8),
              radius: radius,
            ),
    );
  }
}
