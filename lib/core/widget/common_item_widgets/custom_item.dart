import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teaching/core/enums.dart';
import 'package:teaching/core/widget/build_rating_bar.dart';

import '../../export/export.dart';

class CustomItem extends StatelessWidget {
  CustomItem(
      {super.key,
      this.isSubScribe = false,
      this.groupsModel,
      this.onTap,
      this.coursesModel});
  bool? isSubScribe;
  final void Function()? onTap;
  final GroupsModel? groupsModel;
  final CoursesModel? coursesModel;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 5),
        ],
        radius: 10.r,
        borderColor: AppColors.textGrayColor1.withOpacity(0.2),
        borderWidth: 1,
        padding: getPadding(top: 15.h, bottom: 10.h, horizontal: 20.w),
        backgroundColor: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // isCircle
            //     ? CustomNetworkImage.circular(
            //         radius: 70.r,
            //         imageUrl: AppAssets().student,
            //       )
            //     :
            CustomNetworkImage.rectangle(
              width: 70.w,
              height: 80.h,
              imageUrl: coursesModel.isNotNull
                  ? '${EndPoints.baseUrl}${coursesModel!.teacherPicture!}'
                  : '${EndPoints.baseUrl}${groupsModel!.teacherPicture!}',
            ),
            isSubScribe.isTrue ? 15.vs : 10.vs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // RoleType.student.isTrue
                  //     ?
                  CustomTextWidget(
                    textScalar: TextScaler.linear(0.9),
                    lines: 1,
                    align: TextAlign.center,
                    text: coursesModel.isNotNull
                        ? '${context.read<LanguageCubit>().isEn ? coursesModel!.courseTitleEn : coursesModel!.subjectName!}'
                        : '${context.read<LanguageCubit>().isEn ? groupsModel!.groupNameEn : groupsModel!.subjectName!}',
                    style: getBoldTextStyle(
                      fontSize: 16,
                      fontFamily: FontFamilies.abhayaLibreFamily,
                    ),
                  ),
                  //     :
                  // Column(
                  //         children: [
                  //           CustomTextWidget(
                  //             text: 'مجموعة لغه عربية',
                  //             style: getBoldTextStyle(
                  //               fontSize: 16,
                  //               fontFamily: FontFamilies.abhayaLibreFamily,
                  //             ),
                  //           ),
                  //           5.vs,
                  //           CustomTextWidget(
                  //             text: 'Amgad Amgad Amgad ',
                  //             style: getBoldTextStyle(
                  //               fontSize: 16,
                  //               fontFamily: FontFamilies.dubaiFamily,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  5.vs,
                  // isStar
                  //     ? BuildRatingBar(
                  //         itemSize: 20,
                  //         itemCount: 5,
                  //         rate: 5,
                  //       )
                  //     // RatingBar.builder(
                  //     //         initialRating: 3,
                  //     //         minRating: 1,
                  //     //         direction: Axis.horizontal,
                  //     //         allowHalfRating: true,
                  //     //         itemSize: 20,
                  //     //         itemCount: 5,
                  //     //         // itemPadding: getPadding(horizontal: 2.w),
                  //     //         itemBuilder: (context, _) => const CustomIcon(
                  //     //           icon: Icons.star,
                  //     //           color: AppColors.yellow,
                  //     //         ),
                  //     //         onRatingUpdate: (rating) {
                  //     //           debugPrint('$rating');
                  //     //         },
                  //     //       ):

                  isSubScribe!
                      ? CustomElevatedButton(
                          padding: getPadding(bottom: 5),
                          height: 35.h,
                          width: 80.w,
                          // margin: getMargin(horizontal: 10.w),
                          onPressed: () => onTap!(),
                          text: AppStrings().start.trans)
                      : GestureDetector(
                          child: CustomTextWidget(
                            text: AppStrings().startNow.trans,
                            style: getBoldTextStyle(
                                fontSize: 16,
                                fontFamily: FontFamilies.abhayaLibreFamily,
                                color: AppColors.mainAppColor),
                          ),
                        ),
                ],
              ),
            )
          ],
        ));
  }
}
