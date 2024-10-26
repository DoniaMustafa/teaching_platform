import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';

abstract class SessionsOfGroupDateSource {
  Future<ResponseModel> getSessionsOfGroup({required int groupId});
}

class SessionsOfGroupWithServer extends SessionsOfGroupDateSource {
  DioConsumer dioConsumer;
  SessionsOfGroupWithServer(this.dioConsumer);

  @override
  Future<ResponseModel> getSessionsOfGroup({required int groupId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getGroupSessions,
              queryParams: {"groupId": groupId}),
          fromJsonFunction: SessionsOfGroupResponseModel.fromJson);
}
