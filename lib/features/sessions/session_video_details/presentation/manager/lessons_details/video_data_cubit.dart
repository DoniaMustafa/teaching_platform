import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import '../../../data/models/video_of_session_details_response_model.dart';
import '../../../domain/use_cases/video_of_session_details_use_case.dart';

class VideoDataCubit extends Cubit<CubitStates> {
  VideoDataCubit(this.useCase) : super(InitialState());

  VideoOfSessionDetailsUseCase useCase;
  SessionsGroupVideo? sessions;
  List<GroupVideoAttachment> attachment = [];
  List<GroupVideoComment> comments = [];
  getVideo({required int videoId}) {
    managerExecute<SessionsGroupVideo>(
        useCase.getVideo(videoId: videoId),
        onStart: () {
          comments = [];
          attachment = [];
          emit(LoadingState());
        },
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          sessions = data;


          for (var element in sessions!.groupVideoComments!) {
            comments.addAll({element});
          }
          for (var attachmentElement in sessions!.groupVideoAttachments!) {
            attachment.addAll({attachmentElement});
          }
          if (kDebugMode) {
            print(comments);
            print(attachment);
          }


          emit(LoadedState<SessionsGroupVideo>(data: data!));
        });
  }
}
