import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';

class BuildGroupSessions extends StatelessWidget {
  const BuildGroupSessions({super.key, required this.model});
  final GroupLessonDetailsDataModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: CustomListView(
          padding: getPadding(top: 10),
          itemCount: model.groupSessions!.length,
          shrinkWrap: true,
          axisDirection: Axis.vertical,
          separatorWidget: (context, index) => 10.vs,
          widget: (context, index) => CustomCard(
                padding: getPadding(horizontal: 15.w, vertical: 15.h),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: AppColors.black.withOpacity(0.25))
                ],
                child: Row(
                  children: [
                    CustomCircleWidget(
                      width: 30.w,
                      height: 30.h,
                      alignment: AlignmentDirectional.center,
                      padding: getPadding(all: 0),
                      color: AppColors.mainAppColor,
                      child: CustomTextWidget(
                        text: '${index + 1}',
                        style: getSemiboldTextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: FontFamilies.outfitFamily),
                      ),
                    ),
                    10.hs,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: context.read<LanguageCubit>().isEn.isFalse
                                ? model.groupSessions![index].title!
                                : model.groupSessions![index].titleEn!,
                            style: getSemiboldTextStyle(
                                fontSize: 16,
                                color: AppColors.black.withOpacity(0.68),
                                fontFamily: FontFamilies.outfitFamily),
                          ),
                          // 5.vs,
                          // CustomTextWidget(
                          //   text: model.groupSessions![index].titleEn!,
                          //   style: getMediumTextStyle(
                          //       fontSize: 14,
                          //       color: AppColors.black.withOpacity(0.68),
                          //       fontFamily: FontFamilies.outfitFamily),
                          // ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextWidget(
                          text:
                              '${model.groupSessions![index].classAt!.day.toString()}/${model.groupSessions![index].classAt!.month.toString()}/${model.groupSessions![index].classAt!.year.toString()}',
                          style: getMediumTextStyle(
                              fontSize: 14,
                              color: AppColors.mainAppColor,
                              fontFamily: FontFamilies.outfitFamily),
                        ),
                        5.vs,
                        CustomTextWidget(
                          text:
                              '${model.groupSessions![index].fromTime!.replaceRange(5, 8, '')}  '
                              '${model.groupSessions![index].toTime!.replaceRange(5, 8, '')}',
                          style: getMediumTextStyle(
                              fontSize: 14,
                              color: AppColors.mainAppColor,
                              fontFamily: FontFamilies.outfitFamily),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}