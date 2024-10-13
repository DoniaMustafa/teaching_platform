import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';


class CoursesGroupOperationCubit extends Cubit<CubitStates> {
  CoursesGroupOperationCubit() : super(InitialState());

  int publicTapIndex=0;
  onChangePublicTabIndex(int index){
    publicTapIndex=index;
    if (kDebugMode) {
      print(publicTapIndex);
    }
    emit(LoadedState<int>(data: publicTapIndex));
  }
  int tapIndex=0;
  onChangeTabIndex(int index){
    publicTapIndex=index;
    if (kDebugMode) {
      print(publicTapIndex);
    }
    emit(LoadedState<int>(data: publicTapIndex));
  }
}
