import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/domain/use_cases/exam_use_case.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';

class SubmitExamCubit extends Cubit<CubitStates> {
  SubmitExamCubit(this.useCase) : super(InitialState());
  ExamUseCase useCase;
  submitExam({required SubmitExamParamsModel exam}) {
    executeWithDialog<dynamic>(
        either: useCase.submitExamAnswer(exam: exam),
        onStart: () => emit(LoadingState()),
        startingMessage: AppStrings().loading.trans,
        onError: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          pop();
          pop();
          AppService()
              .getBlocData<ExamQuestionOperationCubit>()
              .selectedQuestion = null;
          AppService().getBlocData<ExamCubit>().getExams();
          emit(LoadedState<dynamic>(data: data!));
        });
  }
}
