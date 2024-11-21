import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

class ParentsOperationCubit extends Cubit<CubitStates> {
  ParentsOperationCubit() : super(InitialState());

  int parentsIndex = 0;
  onChangeParentsIndex(int index) {
    parentsIndex = index;
    // if (parentsIndex == 1) {
    //   Routes.bookPrivateAppointmentGroupsRoute.moveTo;
    // }
    if (kDebugMode) {
      print(parentsIndex);
    }
    emit(LoadedState<int>(data: parentsIndex));
  }

  // int tapIndex = 0;
  // onChangeTabIndex(int index) {
  //   tapIndex = index;
  //   if (kDebugMode) {
  //     print(tapIndex);
  //   }
  //   emit(LoadedState<int>(data: tapIndex));
  // }
  //
  // int? selectedIndex;String? subjectName;
  // onSelectedSubjectIndex(int index,String subject) {
  //   selectedIndex = index;
  //   subjectName= subject;
  //   if (kDebugMode) {
  //     print(selectedIndex);
  //   }
  //   emit(LoadingState());
  // }
}
