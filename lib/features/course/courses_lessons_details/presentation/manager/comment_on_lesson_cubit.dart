import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/comment_on_lessons_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';

// part 'comment_on_lesson_state.dart';

class CommentOnLessonCubit extends Cubit<CubitStates> {
  CommentOnLessonCubit(this.useCase) : super(InitialState());
  CommentOnLessonsUseCase useCase;

  TextEditingController comment = TextEditingController();
  addCommentOnVideo({required int videoId,}) {
    managerExecute(
        useCase.addCommentOnVideo(videoId: videoId, comment: comment.text),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          AppService().getBlocData<LessonsDetailsCubit>().comments.add(
              FirstLessonVideoCommentModel(
                  comment: comment.text,
                  id: videoId,
                  createdAt: DateTime.now(),
                  userName: AppPrefs.user!.name,
                  userImage: AppPrefs.user!.image));
          emit(LoadedState(data: data));
          comment.clear();
        });
  }
}
