import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/domain/use_cases/exam_use_case.dart';

class ExamCubit extends Cubit<CubitStates> {
  ExamCubit(this.useCase) : super(InitialState());
  ExamUseCase useCase;
  getExams({ExamParamsModel? model}) {
    managerExecute<ExamDataModel>(useCase.getExams(model: model),
        onStart: () => emit(LoadingState()),
        onSuccess: (data) => emit(LoadedState<ExamDataModel>(data: data!)),
        onFail: (message) => emit(FailedState(message: message)));
  }
}
