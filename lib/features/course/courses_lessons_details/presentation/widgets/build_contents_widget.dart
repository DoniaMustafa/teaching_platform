import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';

import '../../../../../core/export/export.dart';
import '../../../../exam/presentation/manager/exam_cubit.dart';

class BuildContentsWidget extends StatelessWidget {
  const BuildContentsWidget(
      {super.key, required this.videoModel, required this.lessonModel});
  final List<CourseVideoModel> videoModel;
  final CourseLessonDataMode lessonModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsDetailsCubit, CubitStates>(
      builder: (context, state) {
        return videoModel.isEmpty
            ? const CustomEmptyWidget()
            : CustomListView(
                shrinkWrap: true,
                axisDirection: Axis.vertical,
                itemCount: state is LoadedState
                    ? state.data.courseVideos!.length
                    : AppConstants.shimmerItems,
                separatorWidget: (context, index) => 20.vs,
                widget: (context, index) => _buildItem(videoModel[index]));
      },
    );
  }

  Widget _buildItem(CourseVideoModel model) => GestureDetector(
        onTap: () {
          print(model.courseVideoId);
          AppService()
              .getBlocData<LessonsDetailsCubit>()
              .getLessons(lessonId: model.courseVideoId!);
          // AppService().getBlocData<ExamCubit>().getExams(
          //     model: ExamParamsModel(
          //         courseId: model.courseVideoId,
          //         courseLessonId: lessonModel.lessonId!));
        },
        child: CustomCard(
          padding: getPadding(horizontal: 10.w, vertical: 10.h),
          // backgroundColor: AppColors.mainAppColor,
          child: Row(
            children: [
              CustomNetworkImage.rectangle(
                imageUrl:
                    'https://e7.pngegg.com/pngimages/103/322/png-clipart-black-video-logo-video-icon-video-icon-angle-white-thumbnail.png',
                width: 104.w,
                height: 57.h,
              ),
              10.hs,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: AppService().getBlocData<LanguageCubit>().isEn.isTrue
                        ? model.titleEn!
                        : model.title!,
                    style: getMediumTextStyle(fontSize: 18),
                  ),
                  CustomTextWidget(
                    text: model.duration!,
                    style: getRegularTextStyle(fontSize: 14),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
}
