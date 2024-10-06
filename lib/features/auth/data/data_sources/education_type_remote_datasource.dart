import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import '../../../../core/export/export.dart';

abstract class EducationTypeRemoteDatasource {
  Future<ResponseModel> getEducationType();
  Future<ResponseModel> getEducationPrograms({required int id});
  Future<ResponseModel> getGrade(
      {required int educationProgramsId, required int educationTypeId});
}

class EducationTypeWithServer extends EducationTypeRemoteDatasource {
  DioConsumer dioConsumer;
  EducationTypeWithServer({required this.dioConsumer});

  @override
  Future<ResponseModel> getEducationType() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.educationType,
      ),
      fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> getEducationPrograms({required int id}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.educationProgram,
              queryParams: {"educationTypeId": id}),
          fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> getGrade(
          {required int educationProgramsId,
          required int educationTypeId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getGrades,
              queryParams: {
                "educationTypeId": educationTypeId,
                "programTypeId": educationProgramsId
              }),
          fromJsonFunction: PublicResponseModel.fromJson);
}
