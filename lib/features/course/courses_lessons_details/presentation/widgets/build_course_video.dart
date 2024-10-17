import 'package:flick_video_player/flick_video_player.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/export/export.dart';
import '../manager/lessons_details/lessons_details_cubit.dart';

class BuildCourseVideo extends StatefulWidget {
  const BuildCourseVideo({super.key,required this.model});
  final CourseLessonDataMode model;
  @override
  State<BuildCourseVideo> createState() => _BuildCourseVideoState();
}

class _BuildCourseVideoState extends State<BuildCourseVideo> {
  // FlickManager? flickManager;
  // @override
  // void initState() {
  //   super.initState();
  //   // WidgetsBinding.instance.addPostFrameCallback((data) {
  //   // flickManager =
  //   // });
  // }

  // @override
  // void dispose() {
  //   flickManager!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
        flickManager: FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
          '${EndPoints.url}'
          '${context.read<LessonsDetailsCubit>().lessonData!.firstLessonVideoUrl!}')),
    ));
  }
}
