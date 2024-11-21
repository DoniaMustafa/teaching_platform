import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';

// part 'notes_state.dart';

class NotesOperationCubit extends Cubit<CubitStates> {
  NotesOperationCubit() : super(InitialState());
  int notesIndex = 0;
  onChangeNotesIndex(int index) {
    notesIndex = index;
    if (kDebugMode) {
      print(notesIndex);
    }
    emit(LoadedState<int>(data: notesIndex));
  }

  int count = 1;
  increaseAndDecreaseCount({bool isIncrease = true}) {
    if (isIncrease.isTrue) {
      count++;
    } else {
      count--;
      if (count == 0) {
        count = 1;
      }
    }

    if (kDebugMode) {
      print(count);
    }
    emit(LoadedState<int>(data: count));
  }
}
