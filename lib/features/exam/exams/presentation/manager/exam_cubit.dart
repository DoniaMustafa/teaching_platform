import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/domain/use_cases/exam_use_case.dart';

class ExamCubit extends Cubit<CubitStates> {
  ExamCubit(this.useCase) : super(InitialState());
  ExamUseCase useCase;
  List<PassedExam> passedExams = [];
  List<NotPassedExam> notPassedExam = [];
  getExams({ExamParamsModel? model}) {
    managerExecute<ExamDataModel>(useCase.getExams(model: model),
        onStart: () {
          passedExams = [];
          notPassedExam = [];
          emit(LoadingState());
        },
        onSuccess: (ExamDataModel? data) {
          passedExams.addAll(data!.passedExams!);
          notPassedExam.addAll(data.notPassedExam!);
          print('passedExams >>>>>>>>>> ${passedExams.length}');
          print('notPassedExam>>>>>>>>>>>>>>>>>>> ${notPassedExam.length}');
          emit(LoadedState<ExamDataModel>(data: data));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }
}
