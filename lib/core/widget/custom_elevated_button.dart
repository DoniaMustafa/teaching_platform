import '../export/export.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      this.leftIcon,
      this.rightIcon,
      this.boxShadow,
      required this.onPressed,
      required this.text,
      this.color = AppColors.lightBlue2,
      this.padding,
      this.side = BorderSide.none,
      this.radius = 5,
      this.height,
      this.elevation,
      this.width,
      this.textColor = AppColors.white,
      this.style,
      this.borderColor,
      this.isEnd = false,
      this.isBorder = false,
      this.margin})
      : super(key: key);
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final Widget? leftIcon;
  final String text;
  final Color? borderColor;
  final bool isEnd;
  final Widget? rightIcon;
  final bool isBorder;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? radius;
  final BorderSide side;
  final Color color;
  final TextStyle? style;
  final double? elevation;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? context.width,
      margin: margin,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(radius!),
          // color: color,
          // border: isBorder
          //     ? Border.all(color: AppColors.primaryColor, width: 1)
          //     : null,
          boxShadow: boxShadow),
      child: _buildButton,
    );
  }

  get _buildButton => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: elevation,
          shadowColor: AppColors.transparent,
          side: isBorder
              ? BorderSide(
                  color: borderColor ?? AppColors.primaryColor, width: 1)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
          padding: padding ?? getPadding(vertical: 5, horizontal: 5),
          // shadowColor: AppColors.borderColor.withOpacity(0.5),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!), side: side),
          // padding: padding ?? getPadding(vertical: 10),
        ),
        onPressed: onPressed,
        child: _buildButtonContent,
      );

  get _buildButtonContent => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leftIcon.isNotNull) leftIcon!,
          if (leftIcon.isNotNull) 10.hs,
          Expanded(
            child: Text(
              text,
              textScaler: TextScaler.linear(0.9),
              textAlign: TextAlign.center,
              style: style ??
                  getMediumTextStyle(fontSize: 18, color: textColor, height: 1),
            ),
          ),
          if (rightIcon.isNotNull) 7.97.hs,
          if (isEnd)
            Spacer(
              flex: 1,
            ),
          if (rightIcon.isNotNull) rightIcon!,
        ],
      );
}
