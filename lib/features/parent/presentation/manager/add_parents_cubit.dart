import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/domain/use_cases/parent_use_case.dart';

// part 'parents_state.dart';

class AddParentsCubit extends Cubit<CubitStates> {
  AddParentsCubit(this.useCase) : super(InitialState());
  ParentUseCase useCase;

  addStudentRequest({required int parentId}) {
    managerExecute<dynamic>(
        useCase.addStudentRequest(parentId: parentId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) => emit(LoadedState<dynamic>(data: data!)));
  }
}
