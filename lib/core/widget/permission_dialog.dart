
import '../../config/routes/app_routes_helper.dart';
import '../export/export.dart';

class PermissionDialog extends StatelessWidget {
  final String title;
  final String description;
  final String asset;
  const PermissionDialog({
    required this.title,
    required this.description,
    required this.asset,
    super.key,
  });

  onAllowPressed() async {
    pop(true);
  }

  //AHMED  SOBHY  WAS CODE  HERE
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: getPadding(top: 25.h, bottom: 30.h),
            child:const CustomIcon(
            icon:  Icons.notification_add,
              color: AppColors.primaryColor,
              size: 100,
            ),
          ),
          CustomTextWidget(text: title, style: getBoldTextStyle(fontSize: 20)),
          16.vs,
          CustomTextWidget(text:
            description,
            style: getMediumTextStyle(fontSize: 16, color: AppColors.appBarTitleColor),
          ),
          62.vs,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                onPressed: () => pop(true),
                text: AppStrings().allow.trans,
                radius: 36.h,
              ),
              17.vs,
              CustomElevatedButton(
                onPressed: () => pop(false),
                text: AppStrings().deny.trans,
                style: getMediumTextStyle(color: AppColors.primaryColor, fontSize: 16.h),
                color: AppColors.white,
                radius: 36.h,
                side: BorderSide(color: AppColors.primaryColor, width: 1.h),
              ),
              35.vs
              /*   ElevatedButton(
                  onPressed: () {
                    AppService().pop(false);
                  },
                  child: Text(AppStrings().allow.trans)),
              ElevatedButton(onPressed: onAllowPressed, child: Text("allow")),*/
            ],
          )
        ],
      ),
    );
  }
}
