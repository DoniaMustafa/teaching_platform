import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';

import '../../../../domain/use_cases/education_type_use_case.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit(this.useCase) : super(StageInitial());
  EducationTypeUseCase useCase;
  bool isEducationTypeDone = false;

  int? curriculumId;



  getEducationPrograms({required int id}) {
    managerExecute<List<PublicDataModel>>(useCase.getEducationPrograms(id: id),
        onStart: () => emit(EducationProgramsLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
        isEducationTypeDone = true;
          emit(EducationProgramsLoadedState(data: data!));
        },
        onFail: (message) =>
            emit(EducationProgramsFailureState(message: message)));
  }

}
