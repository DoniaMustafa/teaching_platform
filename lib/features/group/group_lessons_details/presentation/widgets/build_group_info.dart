import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';


class BuildGroupInfo extends StatelessWidget {
  const BuildGroupInfo({super.key, required this.model});
  final GroupLessonDetailsDataModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customGroupInfo(AppStrings().price.trans, model.price!.toString()),
        10.vs,
        _customGroupInfo(AppStrings().date.trans, model.days!),
        10.vs,
        _customGroupInfo(AppStrings().startDate.trans, model.startDate!),
        10.vs,
        _customGroupInfo(AppStrings().subscribeNow.trans, model.groupPeriod!),
        10.vs,
        _customGroupInfo(AppStrings().sessionsNumber.trans, '${model.sessionsCount!} ${AppStrings().session.trans}'),
      ],
    );
  }

  Widget _customGroupInfo(String title, String result) => Row(
        children: [
          CustomTextWidget(
            text: title,
            style: getSemiboldTextStyle(
                fontSize: 16,
                color: AppColors.black.withOpacity(0.68),
                fontFamily: FontFamilies.outfitFamily),
          ),
          const Spacer(),
          CustomTextWidget(
            text: result,
            style: getMediumTextStyle(
                fontSize: 14,
                color: AppColors.mainAppColor,
                fontFamily: FontFamilies.outfitFamily),
          ),
        ],
      );
}
