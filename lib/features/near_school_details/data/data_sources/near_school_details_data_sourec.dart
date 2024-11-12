import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';

abstract class NearSchoolDetailsDataSource {
  Future<ResponseModel> getNearSchoolDetails({required int id});
}

class NearSchoolDetailsWithServer extends NearSchoolDetailsDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getNearSchoolDetails({required int id}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getSchoolDetails, queryParams: {"schoolId": id}),
          fromJsonFunction: SchoolDetailsResponseModel.fromJson);

  NearSchoolDetailsWithServer(this.dioConsumer);
}
