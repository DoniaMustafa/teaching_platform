import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';
import 'package:teaching/features/home_work/data/models/home_work_model.dart';
import 'package:teaching/features/home_work/data/models/homework_question_model.dart';
import 'package:teaching/features/home_work/domain/use_cases/home_work_use_case.dart';

class HomeworkQuestionCubit extends Cubit<CubitStates> {
  HomeworkQuestionCubit(this.useCase) : super(InitialState());
  HomeWorkUseCase useCase;
  List<HomeworkChoice> choices = [];
  getMyHomeWork({required int examId}) {
    managerExecute<HomeworkQuestionDataModel>(
        useCase.getMyHomeWorkQuestion(examId: examId), onStart: () {
      AppService().getBlocData<ExamQuestionOperationCubit>().answers = [];

      emit(LoadingState());
    }, onFail: (message) {
      print(message);
      emit(FailedState(message: message));
    }, onSuccess: (HomeworkQuestionDataModel? data) {
      for (var element in data!.examQuestions!) {
        AppService()
            .getBlocData<ExamQuestionOperationCubit>()
            .answers
            .add(QuestionAnswer(questionId: element.id));
        element.question!.choices!.forEach((choice) {
          choices.add(choice);
        });
      }
      emit(LoadedState<HomeworkQuestionDataModel>(data: data!));
    });
  }
}
