import 'package:teaching/core/export/export.dart';

abstract class SubjectDataSource {
  Future<ResponseModel> getSubjects();
}

class SubjectWithServer extends SubjectDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getSubjects() async => remoteExecute(
      request: dioConsumer.getRequest(path: EndPoints.getStudentSubjects),
      fromJsonFunction: PublicResponseModel.fromJson);

  SubjectWithServer(this.dioConsumer);
}
