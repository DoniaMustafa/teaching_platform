import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/near_school_use_case.dart';



class NearSchoolCubit extends Cubit<CubitStates> {
  NearSchoolCubit(this.useCase) : super(InitialState());
  NearSchoolUseCase useCase;
  getNearSchool() {
    managerExecute<List<GenericDataModel>>(
      useCase.getNearSchool(),
      onSuccess: (data) =>
          emit(LoadedState<List<GenericDataModel>>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
