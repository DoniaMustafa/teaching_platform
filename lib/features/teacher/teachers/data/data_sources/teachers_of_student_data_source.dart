import '../../../../../core/export/export.dart';
import '../models/teacher_respons_model.dart';

abstract class TeachersOfStudentDataSource {
  Future<ResponseModel> getTeachersOfStudent({TeacherModel? model});
}

class TeachersOfStudentWithServer extends TeachersOfStudentDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getTeachersOfStudent({TeacherModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: AppPrefs.userRole == "3"
                  ? EndPoints.getParentTeachers
                  : EndPoints.getTeachers,
              queryParams: model.isNotNull ? model!.toJson() : null),
          fromJsonFunction: TeacherResponseModel.fromJson);

  TeachersOfStudentWithServer(this.dioConsumer);
}
