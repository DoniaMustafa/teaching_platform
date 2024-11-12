import 'package:teaching/config/routes/app_routes_helper.dart';
import 'package:teaching/core/export/export.dart';

void showCreateAccountDialog(context) {
  showCustomDialog(
      context: context,
      title: AppStrings().confirmCode.trans,
      content: '',
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                4,
                (index) => CustomCard(
                      child: Container(),
                      height: 40.h,
                      width: 45.w,
                      backgroundColor: AppColors.mainAppColor,
                    )),
          ),
          17.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: AppStrings().resend.trans,
                style: getSemiboldTextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilies.interFamily,
                    color: AppColors.heavyBlack),
              ),
              CustomTextWidget(
                text: AppStrings().notReceiveCode.trans,
                style: getRegularTextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilies.interFamily,
                    color: AppColors.heavyBlack),
              ),
            ],
          ),
          24.vs,
          CustomElevatedButton(
              width: 228.w, onPressed: () {}, text: AppStrings().confirm.trans),
        ],
      ));
}

Future showCustomDialog({
  required BuildContext context,
  String? message,
  String? content,
  String? title,
  bool isAlert = true,
  Widget? widget,
  bool dismissible = false,
  double? radius,
  double? height,
  TextStyle? style,
  double? space,
}) =>
    showDialog(
      barrierColor: AppColors.black.withOpacity(0.4),
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return Center(
          child: Container(
            height: height ?? 351.h,
            margin: getMargin(horizontal: 40.w, vertical: 15.h),
            padding: getPadding(horizontal: 30.w, vertical: 20.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))),
            alignment: Alignment.center,
            child: Column(
              children: [
                // 20.vs,
                GestureDetector(
                  onTap: () => pop(),
                  child: const Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: CustomIcon(
                        icon: Icons.close,
                      )),
                ),
                25.vs,
                Align(
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      text: title!,
                      align: TextAlign.center,
                      style: style ??
                          getBoldTextStyle(
                            // decoration: TextDecoration.underline,
                            // decorationColor: AppColors.mainAppColor,
                            fontSize: 24,
                            fontFamily: FontFamilies.dubaiFamily,
                            color: AppColors.mainAppColor,
                          ),
                    )),
                20.vs,

                if(widget.isNotNull)
                widget!
                // ],
                // )
              ],
            ),
          ),
        );
      },
    );
