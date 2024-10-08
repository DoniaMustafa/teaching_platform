import 'package:teaching/core/widget/custom_divider.dart';
import 'dart:math' as math;
import '../../../../core/export/export.dart';

class BuildFields extends StatefulWidget {
  const BuildFields({super.key});

  @override
  State<BuildFields> createState() => _BuildFieldsState();
}

class _BuildFieldsState extends State<BuildFields> {
  bool isOpened = false;
  int? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(horizontal: 20.w),
      child: ExpansionTile(
        backgroundColor: AppColors.fillColor,
        // expansionAnimationStyle: AnimationStyle(
        //   curve: Curves.easeInOutQuad,
        // ),
        onExpansionChanged: (val) {
          isOpened = val;
          setState(() {
            print(isOpened);
          });
        },
        minTileHeight: 5.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              width: 1,
              color: AppColors.borderColor2.withOpacity(0.3),
            )),
        collapsedIconColor: isOpened ? AppColors.mainAppColor : AppColors.white,
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        title: CustomTextWidget(
          text: AppStrings().fields.trans,
          style: getSemiboldTextStyle(
              fontSize: 18,
              fontFamily: FontFamilies.elMessiriFamily,
              color: isOpened ? AppColors.mainAppColor : AppColors.white),
        ),
        collapsedBackgroundColor: AppColors.mainAppColor,
        leading: CustomImageWidget(asset: AppAssets().category,width: 35.w,height: 35.h,),
        childrenPadding: getPadding(horizontal: 10.w),
        children: [
          CustomDivider(
            color: AppColors.textGrayColor1,
            width: width / 1.2,
            height: 1,
          ),
          10.vs,
          SizedBox(
            child: CustomScrollView(shrinkWrap: true, slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => GestureDetector(
                    onTap: () {
                      selectedItem = index;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: selectedItem == index
                              ? BorderRadius.circular(20.r)
                              : null,
                          color: selectedItem == index
                              ? AppColors.selectedColor
                              : AppColors.transparent),
                      padding: getPadding(
                        horizontal: 10.w,
                      ),
                      child: Row(
                        children: [
                          CustomCircleWidget(
                            height: 25.h,
                            width: 25.w,
                            radius: 25,
                            color: Color.fromARGB(
                                212,
                                math.Random().nextInt(245),
                                math.Random().nextInt(256),
                                math.Random().nextInt(256)),
                          ),
                          10.hs,
                          CustomTextWidget(
                            text: 'علوم البيئة',
                            style: getRegularTextStyle(
                              fontSize: 14,
                              fontFamily: FontFamilies.elMessiriFamily,
                              color: selectedItem == index? AppColors.white: AppColors.darkMainAppColor,
                            ),
                          ),
                          const Spacer(),
                          selectedItem == index
                              ? const CustomIcon(
                                  icon: Icons.arrow_forward_ios,
                                  color: AppColors.white,
                                  size: 15,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: width / 2,
                  crossAxisSpacing: 1,
                  mainAxisExtent: 35,
                  mainAxisSpacing: 0.2,
                ),
              ),
            ]),
          ),
          10.vs,
          CustomDivider(
            color: AppColors.textGrayColor1,
            width: width / 1.2,
            height: 1,
          ),
          10.vs,
        ],
      ),
    );
  }
}
