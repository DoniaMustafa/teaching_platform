
import '../export/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.onTap,
    this.endTitle,
    this.endSubtitle,
    required this.title,
    this.image,
    this.color,
    this.style,
    this.r,
    this.isBorder = true,
    this.isIcon = false,
    this.padding,
    this.isCircle = true,
    this.spacer = 20,
    this.subTitleStyle,
    this.radiusDirectional,
    this.iconColor,
    this.subtitle,
    this.height,
    this.widget,
    this.boxShadow,
    this.rate,
    this.margin,
    this.followers,
    this.borderColor,
    this.isDivider = true,
  });

  final String title;
  final String? endTitle;
  final EdgeInsetsDirectional? margin;
  final BorderRadiusDirectional? radiusDirectional;
  final double? rate;
  final String? followers;
  final String? subtitle;
  final bool? isIcon;
  final EdgeInsetsDirectional? padding;
  final double? spacer;
  final double? r;
  final double? height;
  final bool? isBorder;
  final bool? isCircle;
  final bool? isDivider;
  final Widget? widget;
  final String? image;
  final TextStyle? style;
  final TextStyle? subTitleStyle;
  final String? endSubtitle;
  final Color? color;
  final Color? iconColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (isDivider.isTrue)
            CustomDivider(
              width: 5,
              height: height,
              color: AppColors.mainAppColor,
            ),
          Expanded(
            child: CustomCard(
              margin: margin,
              radiusDirectional: radiusDirectional,
              padding: padding,
              borderWidth: isBorder.isTrue ? 1 : 0,
              borderColor: isBorder.isTrue
                  ? borderColor ?? AppColors.borderColor2
                  : null,
              boxShadow: boxShadow,
              radius: r ?? 10.r,
              backgroundColor: color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (image.isNotNull)
                    isCircle.isTrue
                        ? CustomNetworkImage.circular(
                            imageUrl: image,
                            radius: 50.r,
                            defaultAsset: '',
                          )
                        : CustomNetworkImage.rectangle(
                            imageUrl: image,
                            width: 80.w, defaultAsset: '',
                            height: 70.h,
                            // radius: 50.r,
                          ),
                  if (image.isNotNull) spacer!.hs,
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: style.isNull
                            ? getBoldTextStyle(
                                fontSize: 15, color: AppColors.black)
                            : style,
                      ),
                      if (subtitle.isNotNull)
                        Text(subtitle!,
                            style: subTitleStyle ??
                                getRegularTextStyle(
                                  fontSize: 16,
                                  color: AppColors.grayColor1,
                                )),
                      if (followers.isNotNull)
                        Row(
                          children: [
                            Expanded(
                              child: Text(followers!,
                                  style: subTitleStyle ??
                                      getRegularTextStyle(
                                          fontSize: 12,
                                          color: AppColors.grayColor1,
                                          height: 1.3)),
                            ),
                            if (rate.isNotNull)
                              BuildRatingBar(
                                itemCount: 4,
                                isIgnoreRate: true,
                                itemSize: 20,
                                rate: rate!,
                              ),
                          ],
                        ),
                    ],
                  )),
                  if (isIcon!)
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: iconColor ?? AppColors.black,
                    ),
                  if (isIcon.isFalse)
                    Column(
                      children: [
                        if (endTitle.isNotNull)
                          Text(endTitle!,
                              style: subTitleStyle ??
                                  getSemiboldTextStyle(
                                    fontSize: 15,
                                    color: AppColors.mainAppColor,
                                  )),
                        if (endTitle.isNotNull) 5.vs,
                        if (endSubtitle.isNotNull)
                          Text(endSubtitle!,
                              style: subTitleStyle ??
                                  getSemiboldTextStyle(
                                      fontSize: 15,
                                      color: AppColors.mainAppColor,
                                      height: 1)),
                        if (widget.isNotNull) widget!
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
