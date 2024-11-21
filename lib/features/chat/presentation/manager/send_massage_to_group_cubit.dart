import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/groups_chat_response_model.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';
import 'package:teaching/features/chat/presentation/manager/chat_group_massages_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_of_group_cubit.dart';

class SendMassageToGroupCubit extends Cubit<CubitStates> {
  SendMassageToGroupCubit(this.useCase) : super(InitialState());
  ChatUseCase useCase;
  TextEditingController controller = TextEditingController();
  getSingleGroupChats({required int chatGroupId, required String text}) {
    managerExecute<dynamic>(
      useCase.sendChatGroupMessage(chatGroupId: chatGroupId, text: text),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) {
        AppService()
            .getBlocData<ChatGroupMassagesCubit>()
            .getChatGroupMessages(chatGroupId: chatGroupId);
        AppService().getBlocData<ChatOfGroupCubit>().getSingleGroupChats();
        controller.clear();
        emit(LoadedState<dynamic>(data: data!));
      },
    );
  }
}
