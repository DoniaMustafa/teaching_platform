import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/data/models/exam_questions_model.dart';
import 'package:teaching/features/exam/exams/domain/use_cases/exam_use_case.dart';

class ExamQuestionOperationCubit extends Cubit<CubitStates> {
  ExamQuestionOperationCubit() : super(InitialState());

  int? selectedIndex;
  String formattedDuration = '';
  int? selectedQuestion;
  List<int>? selectIndex = [];
  List<QuestionAnswer> answers = [];
  QuestionAnswer? answer;
  onChangePage({required int index}) {
    selectedIndex = index;
    emit(LoadedState<int>(data: index));
  }

  onChangeQuestionAnswer({
    required int index,
    required int questionsIndex,
    required String answer,
  }) {
    selectedQuestion = index;
    answers[questionsIndex].answer = answer;
    emit(LoadingState());
  }
}
