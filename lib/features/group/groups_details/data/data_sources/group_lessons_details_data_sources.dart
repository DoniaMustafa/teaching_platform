import 'package:teaching/features/group/groups_details/data/models/group_details_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class GroupDetailsDataSources {
  Future<ResponseModel> getGroupDetails(
      {required int teacherId, int? subjectId});
}

class GroupDetailsWithServer extends GroupDetailsDataSources {
  GroupDetailsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getGroupDetails(
          {required int teacherId, int? subjectId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getTeacherDetailsGroups,
              queryParams: {"teacherId": teacherId, "subjectId": subjectId}),
          fromJsonFunction: GroupDetailsResponseModel.fromJson);
}
