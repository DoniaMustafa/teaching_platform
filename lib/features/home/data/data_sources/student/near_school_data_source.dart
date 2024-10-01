import '../../../../../core/export/export.dart';
import '../../../../../core/model/generic_response_model.dart';

abstract class NearSchoolDataSource {
  Future<ResponseModel> getNearSchool();

}
class NearSchoolWithServer extends NearSchoolDataSource{
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getNearSchool() async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.school,
      ),
      fromJsonFunction: GenericResponseModel.fromJson);
  NearSchoolWithServer(this.dioConsumer);
}