import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';

// part 'notes_state.dart';

class NotesCubit extends Cubit<CubitStates> {
  NotesCubit(this.useCase) : super(InitialState());
  NotesUseCase useCase;
  List<TeacherDetailsData> modelData= [];
  List<TeacherDetailsData> searchResult = [];
  String teacherName = '';
  getNotes({TeacherModel? model}) {
    managerExecute<List<TeacherDetailsData>>(useCase.getNotes(model: model),
        onStart: () {  modelData = [];
          emit(LoadingState());
        },
        onSuccess: (data) {
          modelData = data!;
          searchResult = modelData;
          emit(LoadedState<List<TeacherDetailsData>>(data: modelData));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }



  searchInList(String query) {
    final searchQuery = query.toLowerCase();
    teacherName = query;
    if (searchQuery.isEmpty) {
      searchResult = modelData; // Display all items when search text is cleared
      print(searchResult);
    } else {
      searchResult = modelData
          .where((item) => item.teacherName!.toLowerCase().contains(searchQuery))
          .toList();
      print(searchResult);
    }
    emit(LoadedState<List<TeacherDetailsData>>(data: searchResult));
  }
}
