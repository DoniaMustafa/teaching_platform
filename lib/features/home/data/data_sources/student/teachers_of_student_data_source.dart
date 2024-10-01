import '../../../../../core/export/export.dart';
import '../../models/teacher_respons_model.dart';

abstract class TeachersOfStudentDataSource{
Future<ResponseModel>getTeachersOfStudent();
}
class TeachersOfStudentWithServer extends TeachersOfStudentDataSource{
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getTeachersOfStudent()async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getTeachers,
      ),
      fromJsonFunction: TeacherResponseModel.fromJson);

  TeachersOfStudentWithServer(this.dioConsumer);
}