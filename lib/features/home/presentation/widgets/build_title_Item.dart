import 'package:teaching/core/export/export.dart';

class BuildTitleItem extends StatelessWidget {
  const BuildTitleItem(
      {super.key, required this.text, this.onTap, this.asset, this.all});
  final String text;
  final Function? onTap;
  final String? asset;
  final String? all;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(start: 20.w),
      child: Row(
        children: [
          CustomTextWidget(
            text: text,
            style: getSemiboldTextStyle(
                fontSize: 18, fontFamily: FontFamilies.elMessiriFamily),
          ),
          if (asset.isNotNull) 5.hs,
          if (asset.isNotNull)
            CustomImageWidget(
              asset: asset!,
              width: 20.w,
              height: 20.h,
            ),
          if (all.isNotNull) const Spacer(),
          if (all.isNotNull)
            GestureDetector(
              onTap: () => onTap!(),
              child: Padding(
                padding: getPadding(end: 20.w),
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: all!,
                      style: getSemiboldTextStyle(
                          fontSize: 14,
                          fontFamily: FontFamilies.elMessiriFamily),
                    ),
                    2.hs,
                    const CustomIcon(
                      icon: Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
