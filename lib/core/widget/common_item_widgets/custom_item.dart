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
      this.onNavigateTap,
      this.scalar,
      this.coursesModel});
  bool? isSubScribe;
  final void Function()? onTap;
  final GroupsModel? groupsModel;
  final TextScaler? scalar;
  final CoursesModel? coursesModel;
  final void Function()? onNavigateTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateTap,
      child: CustomCard(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomNetworkImage.circular(
                radius: 90.r,
                imageUrl: coursesModel.isNotNull
                    ? '${EndPoints.baseUrl}${coursesModel!.teacherPicture!}'
                    : '${EndPoints.baseUrl}${groupsModel!.teacherPicture!}',
              ),
              15.vs,
              Expanded(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // RoleType.student.isTrue
                    //     ?

                    CustomTextWidget(
                      text: coursesModel.isNotNull
                          ? coursesModel!.teacherName!
                          : groupsModel!.teacherName!,
                      overflow: TextOverflow.ellipsis,
                      lines: 1,
                      textScalar: const TextScaler.linear(1),
                      style: getSemiboldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                    isSubScribe.isTrue ? 10.vs : 5.vs,
                    CustomTextWidget(
                      textScalar: const TextScaler.linear(1),
                      lines: 1,
                      align: TextAlign.center,
                      // text: "dfdafdfd",
                      text: coursesModel.isNotNull
                          ? coursesModel!.subjectName!
                          : groupsModel!.subjectName!,
                      style: getSemiboldTextStyle(
                        height: 1,
                        fontSize: 16,
                      ),
                    ),

                    isSubScribe.isTrue ? 10.vs : 12.vs,
                    isSubScribe!
                        ? BuildRatingBar(
                            itemSize: 20,
                            itemCount: 5,
                            rate: coursesModel.isNotNull
                                ? coursesModel!.rate
                                : groupsModel!.rate??0.0,
                            isIgnoreRate: true,
                          )
                        : GestureDetector(
                            onTap: onTap,
                            child: CustomTextWidget(
                              text: AppStrings().startNow.trans,
                              style: getBoldTextStyle(
                                  fontSize: 16,
                                  // fontFamily: FontFamilies.abhayaLibreFamily,
                                  color: AppColors.mainAppColor),
                            ),
                          ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
