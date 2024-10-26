import '../../../../core/export/export.dart';

class BuildChooseToYou extends StatelessWidget {
  const BuildChooseToYou({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3 / 0.8,
      // height: 200.h,
      child: CustomListView( axisDirection: Axis.horizontal,
          padding: getPadding(horizontal: 20.w, bottom: 5.h),
          separatorWidget: (context, index) => SizedBox(
                width: 20.w,
              ),
          itemCount: AppListsConstant.listOfStudentCategories.length,
          widget: (context, index) => _buildItem),
    );
  }

  get _buildItem => CustomCard(
      width: 240.w,
      boxShadow: [
        BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 6),
      ],
      radiusDirectional: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(15), bottomStart: Radius.circular(15)),
      borderColor: AppColors.textGrayColor1.withOpacity(0.2),
      borderWidth: 1,
      // padding: getPadding(top: 15.h, bottom: 10.h,horizontal: 20.w),
      backgroundColor: AppColors.fillColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage.rectangle(
            imageUrl:
                'https://static.wixstatic.com/media/65246d_c7bd3ba476fb4191af59a11494ad027f~mv2.jpg/v1/fill/w_820,h_460,al_c,q_85/65246d_c7bd3ba476fb4191af59a11494ad027f~mv2.jpg',
            height: 100.h,
            width: 230,
          ),
          5.vs,
          Expanded(
            child: Padding(
              padding: getPadding(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'كورس تصميم',
                    style: getSemiboldTextStyle(
                        fontSize: 16,
                        color: AppColors.titleColorPurple,
                        fontFamily: FontFamilies.abhayaLibreFamily),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: 'برمجة : JavaScript ,HTML  and CSS',
                    overflow: TextOverflow.ellipsis,
                    lines: 1,
                    style: getBoldTextStyle(
                        height: 1,
                        fontSize: 14,
                        fontFamily: FontFamilies.abhayaLibreFamily),
                  ),
                  10.vs,
                  CustomTextWidget(
                    text: 'احمد ابراهيم علي',
                    style: getMediumTextStyle(
                        height: 1,
                        fontSize: 14,
                        fontFamily: FontFamilies.abhayaLibreFamily),
                  ),
                  8.vs,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: '2.2',
                        style: getMediumTextStyle(
                            height: 1,
                            fontSize: 11,
                            color: AppColors.yellow,
                            fontFamily: FontFamilies.elMessiriFamily),
                      ),
                      3.hs,
                      BuildRatingBar(
                        itemSize: 15,
                        itemCount: 5,
                        rate: 5,
                      ),
                    ],
                  ),
                  10.vs,
                  CustomTextWidget(
                    text: '125.22 ج.م',
                    style: getMediumTextStyle(
                        height: 1,
                        fontSize: 12,
                        color: AppColors.borderColor,
                        fontFamily: FontFamilies.elMessiriFamily),
                  ),
                ],
              ),
            ),
          )
        ],
      ));
}
