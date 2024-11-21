import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/data/models/notes_details_response_model.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';

// part 'notes_state.dart';

class NotesDetailsCubit extends Cubit<CubitStates> {
  NotesDetailsCubit(this.useCase) : super(InitialState());
  NotesUseCase useCase;

  getNotesDetails({required int notebookId}) {
    managerExecute<NotebookDetailsData>(useCase.getNotesDetails(notebookId: notebookId),
        onStart: () {
          emit(LoadingState());
        },
        onSuccess: (data) {
          emit(LoadedState<NotebookDetailsData>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }
}
