import '../../export/export.dart';

class BuildSharedAppBar extends StatelessWidget {
  const BuildSharedAppBar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        radius: 0,
        backgroundColor: AppColors.mainAppColor,
        child:
        CustomTextWidget(
          align: TextAlign.center,
          text:title,
          style: getBoldTextStyle(
              fontSize: 24,
              color: AppColors.white,
             ),
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
