import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/data/models/exam_questions_model.dart';
import 'package:teaching/features/exam/exams/domain/use_cases/exam_use_case.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';

class ExamQuestion extends Cubit<CubitStates> {
  ExamQuestion(this.useCase) : super(InitialState());
  ExamUseCase useCase;
  List<Choice> choices=[];

  getExamsQuestion({required int examId}) {
    managerExecute<ExamQuestionsData>(useCase.getTestYourself(examId: examId),
        onStart: () {
          AppService().getBlocData<ExamQuestionOperationCubit>().answers = [];
          emit(LoadingState());
        },
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          for (var element in data!.questions!) {
            AppService()
                .getBlocData<ExamQuestionOperationCubit>()
                .answers
                .add(QuestionAnswer(questionId: element.id));
            element.choices!.forEach((choice){
              choices!.add(choice);
            });
          }
          print( AppService()
              .getBlocData<ExamQuestionOperationCubit>()
              .answers.last.questionId);
          emit(LoadedState<ExamQuestionsData>(data: data));
        });
  }
}
