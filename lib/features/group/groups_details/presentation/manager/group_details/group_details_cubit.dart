import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';

class GroupDetailsCubit extends Cubit<CubitStates> {
  GroupDetailsCubit(this.useCase) : super(InitialState());

  GroupDetailsUseCase useCase;
  getGroupDetails({required int teacherId, int? subjectId}) {
    managerExecute<List<GroupDetailsDataModel>>(
        useCase.getGroupDetails(teacherId: teacherId, subjectId: subjectId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (List<GroupDetailsDataModel>? data) {
          emit(LoadedState<List<GroupDetailsDataModel>>(data: data!));
        });
  }
}
