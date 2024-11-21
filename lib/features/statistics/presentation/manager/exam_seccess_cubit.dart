import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent_children/data/models/children_model.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';
import 'package:teaching/features/parent_children/domain/use_cases/parent_children_ruse_caseo.dart';
import 'package:teaching/features/statistics/domain/use_cases/parent_statistics_for_children_use_case.dart';

// part 'notes_state.dart';

class ExamSuccessCubit extends Cubit<CubitStates> {
  ExamSuccessCubit(this.useCase) : super(InitialState());
  ParentStatisticsForChildrenUseCase useCase;

  getParentStudentExamSuccessRate({required int studentId}) {
    managerExecute<dynamic>(useCase.getParentStudentExamSuccessRate(studentId: studentId),
        onStart: () {
          emit(LoadingState());
        },
        onSuccess: (data) {
          emit(LoadedState<dynamic>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }

}
