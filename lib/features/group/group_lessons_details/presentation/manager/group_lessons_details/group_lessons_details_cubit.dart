import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';

import '../../../data/models/group_Lesson_details_response_model.dart';
import '../../../domain/use_cases/group_lessons_details_use_case.dart';

class GroupLessonsDetailsCubit extends Cubit<CubitStates> {
  GroupLessonsDetailsCubit(this.useCase) : super(InitialState());

  GroupLessonsDetailsUseCase useCase;
  GroupLessonDetailsDataModel? lessonData;
  List<int>availablePlaces=[];
  getLessons({required int lessonId}) {
    managerExecute<GroupLessonDetailsDataModel>(
        useCase.getGroupLessonsDetails(lessonId: lessonId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          lessonData = data;

          AppService().getBlocData<VideoOfSessionOperationCubit>().videoUrl =
              lessonData!.introVideoUrl;
          if (AppService()
                  .getBlocData<VideoOfSessionOperationCubit>()
                  .videoUrl!
                  .contains('vimeo')
                  .isTrue &&
              AppService()
                  .getBlocData<VideoOfSessionOperationCubit>()
                  .videoUrl
                  .isNotNull) {
            RegExp regex = RegExp(r'/(\d+)');
            Match match = regex.firstMatch(AppService()
                .getBlocData<VideoOfSessionOperationCubit>()
                .videoUrl!) as Match;

            String videoId = match.group(1)!;
            AppService().getBlocData<VimeoVideoCubit>().getVimeoVideo(
                vimeoId: videoId.toInt, whichScreen: AppStrings().group);
            print('videoId  >>>>>>>>>> ${videoId}');
          }
          emit(LoadedState<GroupLessonDetailsDataModel>(data: data!));
        });
  }
}
