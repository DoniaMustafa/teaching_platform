import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/courses_groups_use_case.dart';

class CoursesGroupsCubit extends Cubit<CubitStates> {
  CoursesGroupsCubit(this.useCase) : super(InitialState());
  CoursesGroupsUseCase useCase;

  getCourserAndGroups() {
    managerExecute<CoursesAndGroupsDataModel>(
      useCase.getCourserAndGroups(),
      onStart: () => emit(LoadingState()),
      onSuccess: (data) =>
          emit(LoadedState<CoursesAndGroupsDataModel>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
