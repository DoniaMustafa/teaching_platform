import 'package:teaching/core/export/export.dart';

class TeacherDetailsScreen extends StatelessWidget {
  const TeacherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().teachers.trans,
          widget: Container(
            padding: getPadding(
              horizontal: 10.w,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  15.vs,
                  Padding(
                    padding: getPadding(start: 10.h),
                    child: Row(
                      children: [
                        const CustomIcon(
                          icon: Icons.info,
                          color: AppColors.mainAppColor,
                          size: 35,
                        ),
                        const Spacer(),
                        CustomTextWidget(
                          text: 'الغاء المتابعة',
                          style: getRegularTextStyle(
                              fontSize: 20,
                              color: AppColors.mainAppColor,
                              fontFamily: FontFamilies.outfitFamily),
                        )
                      ],
                    ),
                  ),
                  10.vs,
                  CustomNetworkImage.circular(
                    imageUrl: 'image',
                    radius: 130.r,
                  ),
                  CustomTextWidget(
                    text: 'name',
                    style: getBoldTextStyle(
                        fontSize: 20, color: AppColors.black.withOpacity(0.65)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: BuildRatingBar(
                            rate: 3,
                            isIgnoreRate: true,
                            itemCount: 4,
                            itemSize: 25,
                          ),
                        ),
                      ),
                      5.hs,
                      Expanded(
                        flex: 2,
                        child: CustomTextWidget(
                          text: '(25) تقييم',
                          style: getBoldTextStyle(
                              fontSize: 10,
                              color: AppColors.black.withOpacity(0.65)),
                        ),
                      ),
                    ],
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: '(25) متابع',
                    style: getBoldTextStyle(
                        fontSize: 14, color: AppColors.black.withOpacity(0.65)),
                  ),
                  10.vs,
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'قيم الان',
                    margin: getMargin(
                      horizontal: 150.w,
                    ),
                    style: getRegularTextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontFamily: FontFamilies.interFamily),
                    height: 35.h,
                  ),
                  10.vs,
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: List.generate(
                        6,
                        (index) => Chip(
                            backgroundColor: AppColors.fillColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: const BorderSide(
                                  color: AppColors.borderColor2,
                                  width: 1,
                                )),
                            label: CustomTextWidget(
                                text: index.isEven ? 'dvdvdfvdafda' : 'dvdv'))),
                  ),
                  10.vs,
                  Container(
                    margin: getPadding(horizontal: 5.w),
                    child: Column(
                      children: [
                        CustomListTile(
                          height: height / 8.2,
                          title: 'عدد الكورسات',
                          subtitle: '26 كورس',
                          isCircle: false,
                          r: 0,
                          image: AppAssets().coursesIcon,
                          isIcon: true,
                          padding: getPadding(horizontal: 10.w, vertical: 15.h),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: AppColors.black.withOpacity(0.25),
                                blurRadius: 8)
                          ],
                        ),
                        10.vs,
                        CustomListTile(
                            r: 0,
                            height: height / 8.2,
                            title: 'عدد الكورسات',
                            subtitle: '26 كورس',
                            isCircle: false,
                            image: AppAssets().coursesIcon,
                            isIcon: true,
                            padding:
                                getPadding(horizontal: 10.w, vertical: 15.h),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: AppColors.black.withOpacity(0.25),
                                  blurRadius: 8)
                            ]),
                        10.vs,
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomListTile(
                                  r: 0,
                                  height: height / 9.2,
                                  title: 'عدد الكورسات',
                                  subtitle: '26 كورس',
                                  isCircle: false,
                                  // image: AppAssets().coursesIcon,
                                  // isIcon: true,
                                  padding: getPadding(
                                      horizontal: 10.w, vertical: 15.h),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        blurRadius: 8)
                                  ]),
                            ),
                            10.hs,
                            Expanded(
                              child: CustomListTile(
                                  r: 0,
                                  title: 'عدد الكورسات',
                                  height: height / 9.2,
                                  subtitle: '26 كورس',
                                  isCircle: false,
                                  // image: AppAssets().coursesIcon,
                                  // isIcon: true,
                                  padding: getPadding(
                                      horizontal: 10.w, vertical: 15.h),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        blurRadius: 8)
                                  ]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  15.vs,
                ],
              ),
            ),
          ),
        ));
  }
}
