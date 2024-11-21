import '../../export/export.dart';

class BuildSharedAppBar extends StatelessWidget {
  const BuildSharedAppBar(
      {super.key,
      this.title,
      this.paddingTop = 10.0,
      this.widget,
      this.isBackIcon = false});
  final String? title;
  final Widget? widget;
  final bool isBackIcon;

  final double? paddingTop;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 0,
      backgroundColor: AppColors.mainAppColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBackIcon) 15.hs,
          if (isBackIcon)
            GestureDetector(
              onTap: () => pop(),
              child: Padding(
                padding: getPadding(top: paddingTop),
                child: const CustomIcon(
                  icon: Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
          if (title.isNotNull)
            Expanded(
              child: CustomTextWidget(
                align: TextAlign.center,
                text: title!,
                textScalar: const TextScaler.linear(0.9),
                style: getBoldTextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                ),
              ),
            ),
          if (widget.isNotNull) widget!,
          30.hs
        ],
      ),
      // Expanded(
      //     child: Padding(
      //       padding: getPadding(top: 12.5.h),
      //       child:
      //     ))
      // Row(crossAxisAlignment: CrossAxisAlignment.start,
      //
      //   children: [
      //     CustomCircleWidget(
      //         height: 20.h,
      //         color: AppColors.white,
      //         margin: getMargin(all: 17.w),
      //         width: 20.h,
      //         alignment: AlignmentDirectional.center,
      //         padding: getPadding(
      //           start: 5.w,
      //         ),
      //         radius: 5.r,
      //         child: const CustomIcon(
      //           icon: Icons.arrow_back_ios,
      //           color: AppColors.mainAppColor,
      //           size: 14,
      //         )),
      //
      //   ],
      // )
    );
  }
}
