import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/groups_chat_response_model.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';

class ChatOfGroupCubit extends Cubit<CubitStates> {
  ChatOfGroupCubit(this.useCase) : super(InitialState());
  ChatUseCase useCase;
  getSingleGroupChats() {
    managerExecute<List<GroupsChatData>>(
      useCase.getSingleGroupChats(),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) => emit(LoadedState<List<GroupsChatData>>(data: data!)),
    );
  }
}
