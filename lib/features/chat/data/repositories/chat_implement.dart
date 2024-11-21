import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../../domain/repositories/chat_repo.dart';
import '../data_sources/chat_data_source.dart';

class ChatImplement extends ChatRepo {
  ChatDataSource dataSource;

  ChatImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getSingleChats() async =>
      execute(() => dataSource.getSingleChats());

  @override
  Future<Either<Failure, ResponseModel>> getTeachersToChat() async =>
      execute(() => dataSource.getTeachersToChat());
/////////////////////////////////////////////////////////
//   @override
//   Future<Either<Failure, ResponseModel>> getGroupToChat() async=>
//       execute(()=>dataSource.getGroupToChat());

  @override
  Future<Either<Failure, ResponseModel>> getSingleGroupChats() async =>
      execute(() => dataSource.getSingleGroupChats());

  @override
  Future<Either<Failure, ResponseModel>> getChatGroupMessages({
    required int chatGroupId,
  }) async =>
      execute(() => dataSource.getChatGroupMessages(
            chatGroupId: chatGroupId,
          ));

  @override
  Future<Either<Failure, ResponseModel>> sendChatGroupMessage(
          {required int chatGroupId, required String text}) async =>
      execute(() => dataSource.sendChatGroupMessage(
          chatGroupId: chatGroupId, text: text));
}
