import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

part 'home_operation_state.dart';

class HomeOperationCubit extends Cubit<CubitStates> {
  HomeOperationCubit() : super(InitialState());

  String? selected;
  onChangeItem(String item) {
    selected = item;
    emit(LoadedState<String>(data: selected!));
  }
}
