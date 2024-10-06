import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';


class ChatOperationCubit extends Cubit<CubitStates> {
  ChatOperationCubit() : super(InitialState());

  int selectedIndex = 0;

  onChangeTapBarIndex(int index){
    selectedIndex=index;
    emit(LoadedState<dynamic>(data: selectedIndex));
  }

}
