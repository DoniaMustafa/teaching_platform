import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/comment_on_lessons_use_case.dart';

// part 'comment_on_lesson_state.dart';

class CommentOnLessonCubit extends Cubit<CubitStates> {
  CommentOnLessonCubit(this.useCase) : super(InitialState());
  CommentOnLessonsUseCase useCase;
  addCommentOnVideo(int videoId, String comment) {
    managerExecute(
        useCase.addCommentOnVideo(videoId: videoId, comment: comment),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) => emit(LoadedState(data: data)));
  }
}
