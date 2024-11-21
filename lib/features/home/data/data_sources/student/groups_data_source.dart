import 'package:teaching/features/home/data/models/groups_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class GroupsDataSource {
  Future<ResponseModel> getGroups({int? subjectId});
}

class GroupsWithServer extends GroupsDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getGroups({int? subjectId}) async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EnumService.groupsEndPointType(AppPrefs.userRole!),queryParams: {"subjectId":subjectId}
        ,
      ),
      fromJsonFunction: GroupsResponseModel.fromJson);

  GroupsWithServer(this.dioConsumer);
}
