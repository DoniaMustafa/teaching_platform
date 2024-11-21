import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

part 'home_operation_state.dart';

class HomeOperationCubit extends Cubit<CubitStates> {
  HomeOperationCubit() : super(InitialState());

  String? selected;
  int? selectedId = 1;
  onChangeItem(String item, int id) {
    selected = item;
    selectedId = id;
    print('id>>> ${id}');
    print('selectedId>>${selectedId}');
    emit(LoadedState<String>(data: selected!));
  }

  int? selectedInductor;
  onChangeIndicator(int index) {
    selectedInductor = index;

    print('selectedId>>${selectedInductor}');
    emit(LoadingState());
  }
}
