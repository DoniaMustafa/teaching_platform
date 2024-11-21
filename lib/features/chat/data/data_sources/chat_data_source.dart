import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/booking_appointment_group/data/models/appointment_date.dart';
import 'package:teaching/features/chat/data/models/group_chat_massages_model.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/data/models/teachers_to_chat_response_model.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';

import '../models/groups_chat_response_model.dart';

abstract class ChatDataSource {
  Future<ResponseModel> getSingleChats();
  Future<ResponseModel> getSingleChatMessages();
  Future<ResponseModel> getTeachersToChat();
////////////////////////////////////////////////////////

  Future<ResponseModel> getSingleGroupChats();
  Future<ResponseModel> getChatGroupMessages({
    required int chatGroupId,
  });
  Future<ResponseModel> sendChatGroupMessage(
      {required int chatGroupId, required String text});
}

class ChatWithServer extends ChatDataSource {
  DioConsumer dioConsumer;
  ChatWithServer(this.dioConsumer);
  @override
  Future<ResponseModel> getSingleChats() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getSingleChats,
      ),
      fromJsonFunction: GetSingleChatsResponseModel.fromJson);
  @override
  Future<ResponseModel> getSingleChatMessages() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getSingleChatMessages,
      ),
      fromJsonFunction: GetSingleChatsResponseModel.fromJson);
  @override
  Future<ResponseModel> getTeachersToChat() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getTeachersToCha,
      ),
      fromJsonFunction: TeachersToChatResponseModel.fromJson);
////////////////////////////////////////////////////////////////
//   @override
//   Future<ResponseModel> getGroupToChat()async =>
//       remoteExecute(
//           request: dioConsumer.getRequest(
//             path: EndPoints.getChatGroups, ),
//           fromJsonFunction: TeachersToChatResponseModel.fromJson);

  @override
  Future<ResponseModel> getSingleGroupChats() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getChatGroups,
      ),
      fromJsonFunction: GroupsChatResponseModel.fromJson);

  @override
  Future<ResponseModel> getChatGroupMessages({
    required int chatGroupId,
  }) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
            path: EndPoints.getChatGroupMessages,
            queryParams: {
              "chatGroupId": chatGroupId,
            },
          ),
          fromJsonFunction: GroupChatMassagesModel.fromJson);

  @override
  Future<ResponseModel> sendChatGroupMessage(
          {required int chatGroupId, required String text}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
            path: EndPoints.sendChatGroupMessage,
            body: {"ChatGroupId": chatGroupId, "Text": text},
          ),
          fromJsonFunction: ResponseModel.fromJson);
}
