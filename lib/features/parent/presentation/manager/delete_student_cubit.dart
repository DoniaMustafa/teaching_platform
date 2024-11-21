import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/domain/use_cases/parent_use_case.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';

// part 'parents_state.dart';

class DeleteStudentCubit extends Cubit<CubitStates> {
  DeleteStudentCubit(this.useCase) : super(InitialState());
  ParentUseCase useCase;

  addStudentRequest({required int studentId}) {
    managerExecute<dynamic>(useCase.deleteParentStudent(studentId: studentId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          AppService().getBlocData<ParentChildrenCubit>().getParentChildren();
          emit(LoadedState<dynamic>(data: data!));
        });
  }
}
