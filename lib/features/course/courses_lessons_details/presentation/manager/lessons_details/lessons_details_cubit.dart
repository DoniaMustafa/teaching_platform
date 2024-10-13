import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';

import '../../../domain/use_cases/lessons_details_use_case.dart';

class LessonsDetailsCubit extends Cubit<CubitStates> {
  LessonsDetailsCubit(this.useCase) : super(InitialState());

  LessonsDetailsUseCase useCase;
  CourseLessonDataMode? lessonData;
  getLessons({required int lessonId}) {
    managerExecute<CourseLessonDataMode>(
        useCase.getLessonsDetails(lessonId: lessonId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          lessonData=data;
          emit(LoadedState<CourseLessonDataMode>(data: data!));
        });
  }
}
