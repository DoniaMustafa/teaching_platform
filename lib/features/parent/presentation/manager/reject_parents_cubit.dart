import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/domain/use_cases/parent_use_case.dart';
import 'package:teaching/features/parent/presentation/manager/student_request_parents_cubit.dart';

// part 'parents_state.dart';

class RejectParentsCubit extends Cubit<CubitStates> {
  RejectParentsCubit(this.useCase) : super(InitialState());
  ParentUseCase useCase;

  rejectStudentParentRequest({required int parentId}) {
    managerExecute<dynamic>(
        useCase.rejectStudentParentRequest(parentId: parentId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          AppService()
              .getBlocData<StudentRequestParentsCubit>()
              .getRequestOfParents();
          emit(LoadedState<dynamic>(data: data!));
        });
  }
}
