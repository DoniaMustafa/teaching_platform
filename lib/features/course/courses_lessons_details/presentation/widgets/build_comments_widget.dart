import 'package:teaching/core/export/export.dart';


class BuildCommentsWidget extends StatelessWidget {
  const BuildCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomListView(
            shrinkWrap: true,
            axisDirection: Axis.vertical,
            padding: getPadding(vertical: 20.h),
            itemCount: 5,
            separatorWidget: (context, index) => 10.vs,
            widget: (context, index) => _buildItem),
        CustomTextFormField(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          isFill: true,
          suffixIcon: AppAssets().send,
          suffixConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.h),
          hintText: AppStrings().addComment.trans,
          padding: getPadding(bottom: 10.h, horizontal: 20.w),
        )
      ],
    );
  }

  get _buildItem => Padding(
        padding: getPadding(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            CustomNetworkImage.circular(
              imageUrl: 'imageUrl',
              radius: 50.r,
              defaultAsset: '',
            ),
            10.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'سارة وجدي',
                    style: getBoldTextStyle(
                        fontSize: 15, color: AppColors.mainAppColor),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: 'شرح رائع',
                    style: getRegularTextStyle(
                        fontSize: 15,
                        color: AppColors.darkGrey,
                        fontFamily: FontFamilies.interFamily),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
