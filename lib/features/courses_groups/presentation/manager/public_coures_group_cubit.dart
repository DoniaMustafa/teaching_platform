import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/domain/use_cases/public_groups_courses_use_case.dart';

class PublicCouresGroupCubit extends Cubit<CubitStates> {
  PublicCouresGroupCubit(this.useCase) : super(InitialState());
  PublicGroupsCoursesUseCase useCase;
  getPublicGroupsCourses({int? subjectId}) {
    managerExecute<List<CoursesModel>>(
        useCase.getPublicGroupsCourses(subjectId: subjectId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) =>
            emit(LoadedState<List<CoursesModel>>(data: data!)));
  }
}
