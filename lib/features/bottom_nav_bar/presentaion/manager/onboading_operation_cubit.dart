import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/list_states.dart';

class BottomNavBarOperationCubit extends Cubit<CubitStates> {
  BottomNavBarOperationCubit() : super(InitialState());
  
  int selectedIndex=2;
  void onSelectedItem(int index){
    selectedIndex=index;
    print(selectedIndex);
    emit(LoadedState(data: null));
    
  }
}
