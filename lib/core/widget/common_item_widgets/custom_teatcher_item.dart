import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teaching/core/enums.dart';
import 'package:teaching/core/widget/build_rating_bar.dart';
import 'package:teaching/features/home/data/models/teacher_respons_model.dart';

import '../../export/export.dart';

class CustomTeacherItem extends StatelessWidget {
  const CustomTeacherItem({
    super.key,
    required this.teacher,
  });

  final TeacherDataModel teacher;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.teacherDetailsRoute.moveTo,
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
            children: [
              CustomNetworkImage.circular(
                  radius: 70.r,
                  imageUrl: '${EndPoints.baseUrl}${teacher.profileImage!}'),
              10.vs,
              Expanded(
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTextWidget(
                          text: teacher.name!,
                          style: getBoldTextStyle(
                            fontSize: 16,
                            // fontFamily: FontFamilies.abhayaLibreFamily,
                          ),
                        ),
                        5.vs,
                        CustomTextWidget(
                          text: teacher.subjects!,
                          style: getSemiboldTextStyle(
                            fontSize: 14,
                            // fontFamily: FontFamilies.dubaiFamily,
                          ),
                        ),
                      ],
                    ),
                    5.vs,
                    BuildRatingBar(
                      itemSize: 20,
                      itemCount: 5,
                      rate: 5,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
