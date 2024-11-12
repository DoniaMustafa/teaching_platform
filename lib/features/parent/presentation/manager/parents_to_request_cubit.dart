import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/data/models/student_request_parents_model.dart';
import 'package:teaching/features/parent/domain/use_cases/parent_use_case.dart';

class ParentsToRequestCubit extends Cubit<CubitStates> {
  ParentsToRequestCubit(this.useCase) : super(InitialState());

  ParentUseCase useCase;
  getParentsToAddRequest({String? parentName, String? phoneNumber}) {
    managerExecute<List<PublicDataModel>>(
        useCase.getParentsToAddRequest(
            parentName: parentName, phoneNumber: phoneNumber),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) =>
            emit(LoadedState<List<PublicDataModel>>(data: data!)));
  }
}
