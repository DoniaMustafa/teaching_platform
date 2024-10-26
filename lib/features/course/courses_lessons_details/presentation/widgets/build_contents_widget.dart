import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/video_operation_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/pages/courses_lesson_details_screen.dart';

import '../../../../../core/export/export.dart';
import '../../../../exam/presentation/manager/exam_cubit.dart';

class BuildContentsWidget extends StatefulWidget {
  const BuildContentsWidget(
      {super.key, required this.videoModel, required this.lessonModel});
  final List<CourseVideoModel> videoModel;
  final CourseLessonDataMode lessonModel;

  @override
  State<BuildContentsWidget> createState() => _BuildContentsWidgetState();
}

class _BuildContentsWidgetState extends State<BuildContentsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsDetailsCubit, CubitStates>(
      builder: (context, state) {
        if (widget.videoModel.isEmpty) {
          return const CustomEmptyWidget();
        } else {
          return CustomListView(
              shrinkWrap: true,
              axisDirection: Axis.vertical,
              itemCount: state is LoadedState
                  ? state.data.courseVideos!.length
                  : AppConstants.shimmerItems,
              separatorWidget: (context, index) => 20.vs,
              widget: (context, index) {
                return BlocBuilder<VideoOperationCubit, CubitStates>(
                  builder: (context, state) {
                    return _buildItem(widget.videoModel[index], index);
                  },
                );
              });
        }
      },
    );
  }

  Widget _buildItem(CourseVideoModel model, int index) => GestureDetector(
        onTap: () {
          context.read<VideoOperationCubit>().onFetchUrl(
              model.videoUrl!,
              LessonDetailsScreen.courseId,
              widget.lessonModel.lessonId!,
              widget.lessonModel.courseVideos![index].courseVideoId!,
              index);
        },
        child: CustomCard(
          padding: getPadding(horizontal: 10.w, vertical: 10.h),
          backgroundColor:
              context.read<VideoOperationCubit>().selectedIndex == index
                  ? AppColors.mainAppColorOpacity
                  : AppColors.white,
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
          // ),
        ),
      );
}
