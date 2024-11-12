import '../export/export.dart';

class CustomDialog extends StatelessWidget {
  final String? message;
  final bool? showCircularLoading;
  final AlertTypes dialogType;
  final String? asset;
  final Widget? widget;
  CustomDialog(
      {this.message,
      this.asset,
      this.widget,
      this.showCircularLoading = true,
      Key? key,
      required this.dialogType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.read<LanguageCubit>().isEn
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Dialog(
        clipBehavior: Clip
            .antiAliasWithSaveLayer, // is used to clip the internal child widget of container when u define border radius,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Container(
          width: 343.w,
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              //set widgets vertically
              mainAxisSize: MainAxisSize.min,
              children: [
                // CustomSVGImage(
                //   asset: asset!,
                //    // AppAssets().tripiaLogo,
                //    // height: 38.h,
                //    // width: 85.w,
                //  ),
                //  20.vs,
                AnimatedContainer(
                  duration: 500.milliseconds,
                  child: showCircularLoading!
                      ? Column(
                          //set widgets vertically
                          children: [
                            30.vs,
                            if (dialogType == AlertTypes.loading)
                              SizedBox(
                                  height: 60.h,
                                  width: 60.w,
                                  child: const CircularProgressIndicator(
                                    color: AppColors.mainAppColor,
                                  ))
                            else if (dialogType == AlertTypes.success)
                              SizedBox(
                                  height: 80.h,
                                  width: 80.w,
                                  child: CustomCircleWidget(
                                    height: 30.h,
                                    width: 42.w,
                                    radius: 50.r,
                                    child: const CustomIcon(
                                      icon: Icons.check,
                                      color: AppColors.white,
                                      size: 40,
                                    ),
                                  ))
                            else
                              SizedBox(
                                  height: 80.h,
                                  width: 80.w,
                                  child: CustomCircleWidget(
                                    height: 30.h,
                                    width: 42.w,
                                    radius: 50.r,
                                    child: const CustomIcon(
                                      icon: Icons.close,
                                      color: AppColors.white,
                                      size: 40,
                                    ),
                                  )),
                            // SizedBox(
                            //   height: 80.h,
                            //   width: 80.w,
                            //   child: CustomSvg(
                            //     asset: AppAssets().failure,
                            //     color: AppColors.mainAppColor,
                            //   ),
                            // ),
                            20.vs,
                          ],
                        )
                      : null,
                ),
                if (message != null)
                  Flexible(
                    child: CustomTextWidget(
                      text: message!,
                      softWrap: true,
                      align: TextAlign.center,
                      style: getRegularTextStyle(
                        // fontWeight: FontWeight.,
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                10.vs,
                if (message.isNotNull) 10.vs,
                if (widget.isNotNull) widget!,
                if (widget.isNotNull) 10.vs,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
