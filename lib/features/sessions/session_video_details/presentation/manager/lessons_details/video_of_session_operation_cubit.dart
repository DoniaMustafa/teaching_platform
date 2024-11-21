import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/data/models/video_of_session_details_response_model.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/get_video_view_data_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_data_cubit.dart';

import '../../../../../course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';

class VideoOfSessionOperationCubit extends Cubit<CubitStates> {
  VideoOfSessionOperationCubit() : super(InitialState());

  String? videoUrl;
  String? videoTitle;
  int? videoId;

  int selectedIndex = 0;
  List<GroupVideoComment> videoComment = [];
  List<GroupVideoAttachment> videoAttachment = [];
  void onFetchUrlVideoOfSession(
      {String? urlPath,
      int? groupId,
      int? sessionId,
      int? videoGroupId,
      // List<GroupVideoAttachment>? attachment,
      // List<GroupVideoComment>? comment,
      int? index,
      String? title}) {
    selectedIndex = index!;
    videoTitle = title;

    // videoAttachment = attachment!;
    // videoComment = comment!;
    videoUrl = urlPath;
    videoId = videoGroupId;
    AppService()
        .getBlocData<GetVideoViewDataCubit>()
        .getVideoView(videoId: videoId!);

    if (videoUrl!.contains('vimeo').isTrue) {
      RegExp regex = RegExp(r'/(\d+)');
      Match match = regex.firstMatch(videoUrl!) as Match;

      String vimeoId = match.group(1)!;
      AppService().getBlocData<VimeoVideoCubit>().getVimeoVideo(
          vimeoId: vimeoId.toInt, whichScreen: AppStrings().course);
      print('videoId  >>>>>>>>>> ${videoId}');
    }
    print(
        'onFetchUrl >>>>>>>>>>>>>>>>>>>>> ${videoUrl} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    AppService().getBlocData<VideoDataCubit>().getVideo(videoId: videoId!);
    AppService().getBlocData<ExamCubit>().getExams(
        model: ExamParamsModel(groupId: groupId, groupSessionId: sessionId));

    emit(LoadedState<dynamic>(data: videoUrl));
  }
}
