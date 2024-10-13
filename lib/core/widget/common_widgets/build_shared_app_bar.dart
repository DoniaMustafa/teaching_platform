import '../../export/export.dart';

class BuildSharedAppBar extends StatelessWidget {
  const BuildSharedAppBar({super.key, required this.title,this.isBackIcon=false});
  final String title;
  final bool isBackIcon;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 0,
      backgroundColor: AppColors.mainAppColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(isBackIcon)  15.hs,
          if(isBackIcon)
          GestureDetector(
            onTap: ()=>pop(),
            child: Padding(
              padding: getPadding(top: 10.0),
              child: const CustomIcon(
                icon: Icons.arrow_back_ios,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: CustomTextWidget(
              align: TextAlign.center,
              text: title,
              style: getBoldTextStyle(
                fontSize: 24,
                color: AppColors.white,
              ),
            ),
          ),
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
