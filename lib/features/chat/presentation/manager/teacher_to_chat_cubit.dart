import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/single_chats_model.dart';
import 'package:teaching/features/chat/data/models/teachers_to_chat_response_model.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';

class TeacherToChatCubit extends Cubit<CubitStates> {
  TeacherToChatCubit(this.useCase) : super(InitialState());
  ChatUseCase useCase;
  getTeacherToChat() {
    managerExecute<List<TeachersToChatData>>(
      useCase.getTeachersToChat(),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) =>
          emit(LoadedState<List<TeachersToChatData>>(data: data!)),
    );
  }
}
