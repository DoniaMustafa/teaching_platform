import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';

// part 'exam_operation_state.dart';

class ExamOperationCubit extends Cubit<CubitStates> {
  ExamOperationCubit() : super(InitialState());
  int examTapIndex = 0;
  onChangeTabIndex(int index) {
    examTapIndex = index;
    if (kDebugMode) {
      print(examTapIndex);
    }
    emit(LoadedState<int>(data: examTapIndex));
  }
}
