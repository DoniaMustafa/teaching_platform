import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/grades/my_grades/data/models/my_grades_model.dart';
import 'package:teaching/features/home_work/data/models/home_work_model.dart';
import 'package:teaching/features/home_work/data/models/homework_question_model.dart';

abstract class HomeWorkDataSource {
  Future<ResponseModel> getMyHomeWork({TeacherModel? model});
  Future<ResponseModel> getMyHomeWorkQuestion({int? examId});
}

class HomeWorkWithServer extends HomeWorkDataSource {
  DioConsumer consumer;

  HomeWorkWithServer(this.consumer);

  @override
  Future<ResponseModel> getMyHomeWork(
          {TeacherModel? model}) async =>
      remoteExecute(
          request: consumer.getRequest(
              path: AppPrefs.userRole == "3"
                  ? EndPoints.getParentStudentHomeworks
                  : EndPoints.getStudentHomeworks,
              queryParams: model.isNull ? null : model!.toJson()),
          fromJsonFunction: HomeworksModel.fromJson);

  @override
  Future<ResponseModel> getMyHomeWorkQuestion(
          {int? examId}) async =>
      remoteExecute(
          request: consumer.getRequest(
              path: EndPoints.getStudentHomeworksQuestion,
              queryParams: {"examId": examId}),
          fromJsonFunction: HomeworkQuestionResponseModel.fromJson);
}
