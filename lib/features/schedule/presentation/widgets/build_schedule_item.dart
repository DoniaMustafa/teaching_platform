import 'package:teaching/features/schedule/data/models/scheduel_response_model.dart';

import '../../../../core/export/export.dart';

class BuildScheduleItem extends StatelessWidget {
  const BuildScheduleItem(
      {super.key, required this.model, required this.index});
  final ScheduleDataModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Row(
        children: [
          CustomCircleWidget(
            width: 25.w,
            height: 28.h,
            padding: getPadding(all: 0),
            alignment: AlignmentDirectional.center,
            child: CustomTextWidget(
              text: '${index + 1}',
              style: getSemiboldTextStyle(fontSize: 14, color: AppColors.white),
            ),
          ),
          10.hs,
          Expanded(
            child: CustomCard(
              radius: 10.r,
              borderColor: AppColors.borderColor2,
              borderWidth: 0.5,
              padding: getPadding(start: 15.w, end: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: model.groupTitle!,
                    // '${model.sessions![index].from!.replaceRange(5, 8, '')}  ${model.sessions![0].to!.replaceRange(5, 8, '')}',
                    style: getRegularTextStyle(
                      height: 1,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  20.vs,
                  CustomTextWidget(
                    text: model.subjectName!,
                    style: getRegularTextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
