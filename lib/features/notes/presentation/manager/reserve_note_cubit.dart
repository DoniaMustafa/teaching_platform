import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/data/models/reserve_note_book_model.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';
import 'package:teaching/features/notes/presentation/manager/notes_booked_unbooked_cubit.dart';

// part 'notes_state.dart';

class ReserveNoteCubit extends Cubit<CubitStates> {
  ReserveNoteCubit(this.useCase) : super(InitialState());
  NotesUseCase useCase;
  reserveNoteBook({ReserveNoteBooParamsModel? model, TeacherModel? teacher}) {
    executeWithDialog<dynamic>(
        either: useCase.reserveNoteBook(model: model!),
        startingMessage: AppStrings().loading.trans,
        onStart: () {
          emit(LoadingState());
        },
        onSuccess: (data) {
          pop();
          AppService()
              .getBlocData<NotesBookedUnbookedCubit>()
              .getBookedUnBookedNotes(
                  model: TeacherModel(
                      teacherId: teacher!.teacherId,
                      subjectId: teacher.subjectId));
          emit(LoadedState<dynamic>(data: data));
        },
        onError: (message) => emit(FailedState(message: message)));
  }
}
