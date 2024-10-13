import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/courses_details_use_case.dart';

part 'courses_details_state.dart';

class CoursesDetailsCubit extends Cubit<CubitStates> {
  CoursesDetailsCubit(this.useCase) : super(InitialState());
  CoursesDetailsUseCase useCase;
  getCoursesDetails(model) {
    managerExecute<List<TeacherModel>>(useCase.getCourseDetails(model: model),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (List<TeacherModel>? data) =>
            emit(LoadedState<List<TeacherModel>>(data: data!)));
  }
}
