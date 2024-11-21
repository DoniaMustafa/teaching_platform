import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/video_view_model.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import '../../../data/models/video_of_session_details_response_model.dart';
import '../../../domain/use_cases/video_of_session_details_use_case.dart';

class GetVideoViewDataCubit extends Cubit<CubitStates> {
  GetVideoViewDataCubit(this.useCase) : super(InitialState());

  VideoOfSessionDetailsUseCase useCase;
  Duration? duration;
  int? startAtBySecond;

  getVideoView({required int videoId}) {
    managerExecute<VideoViewData>(useCase.getVideoView(videoId: videoId),
        onStart: () {
          emit(LoadingState());
        },
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          if (data.isNotNull) {
            List<String> timeParts = data!.videoView!.duration!.split(':');
            List<String> secondsAndMillis = timeParts[2].split('.');
            duration = Duration(
                hours: int.parse(timeParts[0]),
                minutes: int.parse(timeParts[1]),
                seconds: int.parse(secondsAndMillis[0]));
            startAtBySecond = duration!.inSeconds;
            print('timeParts  >>>>>>>>>> ${timeParts}');
            print('duration  >>>>>>>>>> ${duration}');
            print('startAtBySecond  >>>>>>>>>> ${startAtBySecond}');
          }

          emit(LoadedState<VideoViewData>(data: data!));
        });
  }
}
