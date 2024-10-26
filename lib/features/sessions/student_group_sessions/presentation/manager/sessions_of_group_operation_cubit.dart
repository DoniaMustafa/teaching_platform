import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';


class SessionsOfGroupOperationCubit extends Cubit<CubitStates> {
  SessionsOfGroupOperationCubit() : super(InitialState());


  int sessionsIndex = 0;
  onChangeSessionsIndex(int index) {
    sessionsIndex = index;
    if (kDebugMode) {
      print(sessionsIndex);
    }
    emit(LoadedState<int>(data: sessionsIndex));
  }
}
