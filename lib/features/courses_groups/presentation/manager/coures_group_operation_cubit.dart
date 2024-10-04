import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';


class CoursesGroupOperationCubit extends Cubit<CubitStates> {
  CoursesGroupOperationCubit() : super(InitialState());

  int tabIndex=0;
  onChangeTabIndex(int index){
    tabIndex=index;
    if (kDebugMode) {
      print(tabIndex);
    }
    emit(LoadedState<int>(data: tabIndex));
  }

}
