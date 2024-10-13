import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.useCase) : super(SubjectInitial());
  EducationTypeUseCase useCase;
  bool isSubjectsDone = false;

  int? subjectsId;

  getSubjects({
    required int educationProgramsId,
    required int educationTypeId,
    required int gradeId,
  }) {
    managerExecute<List<PublicDataModel>>(
        useCase.getSubjects(
            gradeId: gradeId,
            educationProgramsId: educationProgramsId,
            educationTypeId: educationTypeId),
        onStart: () => emit(SubjectLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          isSubjectsDone = true;


          emit(SubjectLoadedState(data: data!));
        },
        onFail: (message) => emit(SubjectFailureState(message: message)));
  }
}
