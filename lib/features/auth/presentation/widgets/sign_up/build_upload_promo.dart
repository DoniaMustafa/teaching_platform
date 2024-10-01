
import '../../../../../core/export/export.dart';

class BuildUploadPromoPart extends StatelessWidget {
  BuildUploadPromoPart({super.key});
  String? radioValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            text: AppStrings().promoUpload.trans,
            style: getBoldTextStyle(
                fontSize: 16,
                fontFamily: FontFamilies.dubaiFamily,
                color: AppColors.darkMainAppColor),
          ),
        ),
        // 10.vs,
        _buildMultiChooseRadio,
        10.vs,
        _buildUploadVideo,
      ],
    );
  }
get _buildMultiChooseRadio=>  Row(
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List.generate(
      AppListsConstant.promo.length,
          (index) => Padding(
        padding: getPadding(end: 10.w),
        child: Row(
          children: [
            Radio(
                value: AppListsConstant.promo[index],
                groupValue: radioValue,
                onChanged: (value) {
                  radioValue = value!;
                  // setState(() {});
                }),
            CustomTextWidget(
              text: AppListsConstant.promo[index],
              style: getRegularTextStyle(
                  fontSize: 16,
                  fontFamily: FontFamilies.outfitFamily),
            )
          ],
        ),
      )),
);
  get _buildUploadVideo => BuildDottedBorder(
    child: Padding(
      padding: getPadding(top: 26.h, bottom: 18.h),
      child: Column(
        children: [
          CustomSvg(asset: AppAssets().uploadVideo),
          4.vs,
          Align(
              alignment: Alignment.center,
              child: CustomTextWidget(
                text: AppStrings().browse.trans,
                style: getRegularTextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilies.dubaiFamily,
                    color: AppColors.mainAppColor),
              ))
        ],
      ),
    ),
  );
}
