import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

class CoursesGroupOperationCubit extends Cubit<CubitStates> {
  CoursesGroupOperationCubit() : super(InitialState());

  int publicTapIndex = 0;
  onChangePublicTabIndex(int index) {
    publicTapIndex = index;
    if (kDebugMode) {
      print(publicTapIndex);
    }
    emit(LoadedState<int>(data: publicTapIndex));
  }

  int tapIndex = 0;
  onChangeTabIndex(int index) {
    tapIndex = index;
    if (kDebugMode) {
      print(tapIndex);
    }
    emit(LoadedState<int>(data: tapIndex));
  }

  int? selectedIndex;String? subjectName;
  onSelectedSubjectIndex(int index,String subject) {
    selectedIndex = index;
    subjectName= subject;
    if (kDebugMode) {
      print(selectedIndex);
    }
    emit(LoadingState());
  }
}
