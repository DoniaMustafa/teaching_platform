import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';


class BuildGroupComponent extends StatelessWidget {
  BuildGroupComponent({super.key, required this.model});
  final GroupLessonDetailsDataModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          3,
          (index) => CustomCard(
                borderWidth: 1,
                borderColor: AppColors.secondBorderColor,
                backgroundColor: AppColors.transparent,
                padding: getPadding(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  children: [
                    CustomIcon(
                      icon: Icons.file_copy_outlined,
                      size: 10,
                    ),
                    20.hs,
                    CustomTextWidget(
                      text: index == 0
                          ? model.subjectName!
                          : index == 1
                              ? model.gradeName!
                              : AppStrings().groups.trans,
                      style: getBoldTextStyle(
                          fontSize: 11, color: AppColors.heavyBlack),
                    ),
                  ],
                ),
              )),
    );
  }
}
