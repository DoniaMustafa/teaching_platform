import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';


class BuildCoursesHeaderComponent extends StatelessWidget {
  BuildCoursesHeaderComponent({super.key, required this.model});
  final TeacherModel model;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      image: '${EndPoints.url}${model.teacherPicture}',
      name: model.teacherName!,
      subjectLabel: model.subjectName!,
      gradeLabel: model.gradeName!,
      labelType: AppStrings().courses.trans,
    );

    // CustomComponent(
    // subjectLabel: model.subjectName!,
    // gradeLabel: model.gradeName!,
    // labelType: AppStrings().courses.trans,
    // );
    //   Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: List.generate(
    //       3,
    //           (index) => CustomCard(
    //         borderWidth: 1,
    //         borderColor: AppColors.secondBorderColor,
    //         backgroundColor: AppColors.transparent,
    //         padding: getPadding(horizontal: 10.w, vertical: 5.h),
    //         child: Row(
    //           children: [
    //             CustomIcon(
    //               icon: Icons.file_copy_outlined,
    //               size: 10,
    //             ),
    //             20.hs,
    //             CustomTextWidget(
    //               text: index == 0
    //                   ? AppStrings().courses.trans
    //                   : index == 1
    //                   ? model.gradeName!
    //                   : model.subjectName!,
    //               style: getBoldTextStyle(
    //                   fontSize: 11, color: AppColors.heavyBlack),
    //             ),
    //           ],
    //         ),
    //       )),
    // );
  }
}
