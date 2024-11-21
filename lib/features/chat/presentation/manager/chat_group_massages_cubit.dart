import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/group_chat_massages_model.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';

class ChatGroupMassagesCubit extends Cubit<CubitStates> {
  ChatGroupMassagesCubit(this.useCase) : super(InitialState());
  ChatUseCase useCase;
  getChatGroupMessages({required int chatGroupId, int? page, int? size}) {
    managerExecute<List<GroupChatMassagesData>>(
      useCase.getChatGroupMessages(chatGroupId: chatGroupId),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) =>
          emit(LoadedState<List<GroupChatMassagesData>>(data: data!)),
    );
  }
}
