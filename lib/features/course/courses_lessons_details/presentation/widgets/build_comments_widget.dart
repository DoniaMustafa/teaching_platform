import 'package:teaching/core/export/export.dart';

import '../../data/models/course_Lesson_details_response_model.dart';

class BuildCommentsWidget extends StatelessWidget {
  const BuildCommentsWidget({super.key, required this.model});
  final CourseLessonDataMode model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        model.firstLessonVideoComments!.isEmpty?const CustomEmptyWidget(): CustomListView(
            shrinkWrap: true,
            axisDirection: Axis.vertical,
            padding: getPadding(vertical: 20.h),
            itemCount:model.firstLessonVideoComments!.length,
            separatorWidget: (context, index) => 10.vs,
            widget: (context, index) =>
                _buildItem(model.firstLessonVideoComments![index])),
        CustomTextFormField(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          isFill: true,
          suffixIcon: AppAssets().send,
          suffixConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.h),
          hintText: AppStrings().addComment.trans,
          padding: getPadding(bottom: 10.h, horizontal: 20.w),
        )
      ],
    );
  }

  Widget _buildItem(FirstLessonVideoCommentModel comment) => Padding(
        padding: getPadding(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            CustomNetworkImage.circular(
              imageUrl: '${EndPoints.url}${comment.userImage}',
              radius: 50.r,
              defaultAsset: '',
            ),
            10.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: comment.userName!,
                    style: getBoldTextStyle(
                        fontSize: 15, color: AppColors.mainAppColor),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: comment.comment??'',
                    style: getRegularTextStyle(
                        fontSize: 15,
                        color: AppColors.darkGrey,
                        fontFamily: FontFamilies.interFamily),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
