
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/comment_on_lessons_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/data/models/video_of_session_details_response_model.dart';

import '../../../../sessions/session_video_details/presentation/manager/lessons_details/video_data_cubit.dart';


class CommentOnLessonCubit extends Cubit<CubitStates> {
  CommentOnLessonCubit(this.useCase) : super(InitialState());
  CommentOnLessonsUseCase useCase;

  TextEditingController comment = TextEditingController();
  addCommentOnVideo({required int videoId,bool isCourse=true}) {
    managerExecute(
        useCase.addCommentOnVideo(videoId: videoId, comment: comment.text,isCourse:isCourse ),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {

          if(isCourse.isFalse){

            AppService().getBlocData<VideoDataCubit>().comments.add(
                GroupVideoComment(
                    comment: comment.text,
                    id: videoId,
                    createdAt: DateTime.now(),
                    userName: AppPrefs.user!.name,
                    userImage: AppPrefs.user!.image));
          }else{
          AppService().getBlocData<LessonsDetailsCubit>().comments.add(
              FirstLessonVideoCommentModel(
                  comment: comment.text,
                  id: videoId,
                  createdAt: DateTime.now(),
                  userName: AppPrefs.user!.name,
                  userImage: AppPrefs.user!.image));}
          emit(LoadedState(data: data));
          comment.clear();
        });
  }
}
