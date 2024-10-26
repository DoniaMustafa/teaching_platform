import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/video_operation_cubit.dart';

import '../../../domain/use_cases/lessons_details_use_case.dart';

class LessonsDetailsCubit extends Cubit<CubitStates> {
  LessonsDetailsCubit(this.useCase) : super(InitialState());

  LessonsDetailsUseCase useCase;
  CourseLessonDataMode? lessonData;

  List<FirstLessonVideoCommentModel> comments = [];
  getLessons({required int lessonId}) {
    managerExecute<CourseLessonDataMode>(
        useCase.getLessonsDetails(lessonId: lessonId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          lessonData = data;
          AppService().getBlocData<VideoOperationCubit>().videoId =
              lessonData!.courseVideos![0].courseVideoId;

          AppService().getBlocData<VideoOperationCubit>().url =
              lessonData!.firstLessonVideoUrl;

          print(
              'Lessons Details url>>>>>>>>>> ${AppService().getBlocData<VideoOperationCubit>().url}');
          lessonData!.firstLessonVideoComments!.forEach((elemnt) {
            comments.add(elemnt);
          });
          emit(LoadedState<CourseLessonDataMode>(data: data!));
        });
  }
}
