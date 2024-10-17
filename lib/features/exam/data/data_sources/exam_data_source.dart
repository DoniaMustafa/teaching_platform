import 'package:teaching/core/export/export.dart';

abstract class ExamDataSource {
  Future<ResponseModel> getExams({ExamParamsModel? model});
}

class ExamWithServer extends ExamDataSource {
  DioConsumer dioConsumer;

  ExamWithServer(this.dioConsumer);

  @override
  Future<ResponseModel> getExams({ExamParamsModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getStudentExams, queryParams: model!.toJson()),
          fromJsonFunction: ExamResponseModel.fromJson);
}
