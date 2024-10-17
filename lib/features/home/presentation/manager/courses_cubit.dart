import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/home/domain/use_cases/student/courses_groups_use_case.dart';

class CoursesCubit extends Cubit<CubitStates> {
  CoursesCubit(this.useCase) : super(InitialState());
  CoursesUseCase useCase;

  getCourser({TeacherModel? model}) {
    managerExecute<List<CoursesModel>>(
      useCase.getCourser(model: model),
      onStart: () => emit(LoadingState()),
      onSuccess: (data) =>
          emit(LoadedState<List<CoursesModel>>(data: data!)),
      onFail: (message) {
        print(message);
        emit(FailedState(message: message));
      },
    );
  }
}
