import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teaching/core/enums.dart';
import 'package:teaching/core/widget/build_rating_bar.dart';

import '../../export/export.dart';

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key,
      this.isCircle = false,
      this.isStar = false,
      this.groupsModel,
      this.coursesModel});
  final bool isCircle;
  final bool isStar;
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
            10.vs,
            Expanded(
              child: Column(
                children: [
                  // RoleType.student.isTrue
                  //     ?
                  CustomTextWidget(
                    text: coursesModel.isNotNull
                        ? '${AppStrings().course.trans} ${context.read<LanguageCubit>().isEn ? coursesModel!.courseTitleEn : coursesModel!.subjectName!}}'
                        : '${AppStrings().groups.trans} ${context.read<LanguageCubit>().isEn ? groupsModel!.groupNameEn : groupsModel!.subjectName!}',
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
                  GestureDetector(
                    child: CustomTextWidget(
                      text: 'ابدء الان',
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
