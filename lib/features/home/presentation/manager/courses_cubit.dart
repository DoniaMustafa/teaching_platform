import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/courses_groups_use_case.dart';

class CoursesCubit extends Cubit<CubitStates> {
  CoursesCubit(this.useCase) : super(InitialState());
  CoursesUseCase useCase;

  getCourser({int? subjectId}) {
    managerExecute<List<CoursesModel>>(
      useCase.getCourser(subjectId: subjectId),
      onStart: () => emit(LoadingState()),
      onSuccess: (data) =>
          emit(LoadedState<List<CoursesModel>>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
