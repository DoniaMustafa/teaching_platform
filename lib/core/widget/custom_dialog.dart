
import '../export/export.dart';

class CustomDialog extends StatelessWidget {
  final String? message;
  final bool? showCircularLoading;
  final AlertTypes dialogType;
  final String? asset;
  CustomDialog({this.message, this.asset, this.showCircularLoading = true, Key? key, required this.dialogType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior:
          Clip.antiAliasWithSaveLayer, // is used to clip the internal child widget of container when u define border radius,
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
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ))
                          else if (dialogType == AlertTypes.success)
                            SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: CustomSvg(
                                asset: AppAssets().success,
                                color: AppColors.primaryColor,
                                // matchTextDirection: false,
                              ),
                            )
                          else
                            SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: CustomSvg(
                                asset: AppAssets().failure,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          20.vs,
                        ],
                      )
                    : null,
              ),
              if (message != null)
                Flexible(
                  child: Text(
                    message!,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: getRegularTextStyle(
                      // fontWeight: FontWeight.,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              10.vs,
              if (message != null) 10.vs,
            ],
          ),
        ),
      ),
    );
  }
}