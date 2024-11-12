import 'package:teaching/core/export/export.dart';
import '../../data/models/course_Lesson_details_response_model.dart';
import '../manager/lessons_details/lessons_details_cubit.dart';

class BuildCommentsWidget extends StatelessWidget {
  BuildCommentsWidget({super.key, required this.videoModel});
  final List<CourseVideoModel> videoModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentOnLessonCubit, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {}
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            context.read<LessonsDetailsCubit>().comments.isEmpty
                ? const CustomEmptyWidget()
                : CustomListView(
                    shrinkWrap: true,
                    axisDirection: Axis.vertical,
                    padding: getPadding(top: 20, bottom: 70.h),
                    itemCount:
                        context.read<LessonsDetailsCubit>().comments.length,
                    separatorWidget: (context, index) => 10.vs,
                    widget: (context, index) => _buildItem(
                        context.read<LessonsDetailsCubit>().comments[index])),
            CustomTextFormField(
              controller: context.read<CommentOnLessonCubit>().comment,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
              isFill: true,
              suffixIcon: AppAssets().send,
              suffixOnTap: () {
                if (context.read<CommentOnLessonCubit>().comment.text.isNotEmpty) {
                  context.read<CommentOnLessonCubit>().addCommentOnVideo(
                        videoId: context.read<VideoOperationCubit>().videoId!,
                      );
                }
              },
              suffixConstraints:
                  BoxConstraints(maxHeight: 40.h, maxWidth: 40.h),
              hintText: AppStrings().addComment.trans,
              padding: getPadding(bottom: 10.h, horizontal: 20.w),
            )
          ],
        );
      },
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
                    style: getRegularTextStyle(
                        fontSize: 16, color: AppColors.mainAppColor),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: comment.comment ?? '',
                    style: getRegularTextStyle(
                        fontSize: 14,
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
