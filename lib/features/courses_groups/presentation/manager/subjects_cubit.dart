import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

import '../../domain/use_cases/subject_use_case.dart';

class SubjectsCubit extends Cubit<CubitStates> {
  SubjectsCubit(this.useCase) : super(InitialState());

  SubjectUseCase useCase;
  getSubjects() {
    managerExecute<List<PublicDataModel>>(useCase.getSubjects(),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (List<PublicDataModel>? data) =>
            emit(LoadedState<List<PublicDataModel>>(data: data!)));
  }
}
