import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';

import '../../../data/models/group_Lesson_details_response_model.dart';
import '../../../domain/use_cases/group_lessons_details_use_case.dart';

class GroupLessonsDetailsCubit extends Cubit<CubitStates> {
  GroupLessonsDetailsCubit(this.useCase) : super(InitialState());

  GroupLessonsDetailsUseCase useCase;
  GroupLessonDetailsDataModel? lessonData;
  getLessons({required int lessonId}) {
    managerExecute<GroupLessonDetailsDataModel>(
        useCase.getGroupLessonsDetails(lessonId: lessonId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          lessonData=data;
          emit(LoadedState<GroupLessonDetailsDataModel>(data: data!));
        });
  }
}
