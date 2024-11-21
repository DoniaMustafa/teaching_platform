import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';

class ChatCubit extends Cubit<CubitStates> {
  ChatCubit(this.useCase) : super(InitialState());
  ChatUseCase useCase;
  getSingleChats() {
    managerExecute<List<SingleChatsData>>(
      useCase.getSingleChats(),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) =>
          emit(LoadedState<List<SingleChatsData>>(data: data!)),
    );
  }
}
