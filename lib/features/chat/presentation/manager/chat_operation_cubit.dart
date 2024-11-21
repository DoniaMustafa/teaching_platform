import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/presentation/manager/chat_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_of_group_cubit.dart';

class ChatOperationCubit extends Cubit<CubitStates> {
  ChatOperationCubit() : super(InitialState());

  int selectedIndex = 0;

  onChangeTapBarIndex(int index) {
    selectedIndex = index;
    if (index == 0) {
      AppService().getBlocData<ChatCubit>().getSingleChats();
    } else {
      AppService().getBlocData<ChatOfGroupCubit>().getSingleGroupChats();
    }
    emit(LoadedState<dynamic>(data: selectedIndex));
  }
}
