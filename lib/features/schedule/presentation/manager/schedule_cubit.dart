import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/schedule/domain/use_cases/schedule_use_case.dart';

class ScheduleCubit extends Cubit<CubitStates> {
  ScheduleCubit(this.useCase) : super(InitialState());
  ScheduleUseCase useCase;
  getSchedule(String selectedDay) {
    managerExecute(useCase.getSchedule(selectedDay: selectedDay),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) => emit(LoadedState(data: data)));
  }
}
