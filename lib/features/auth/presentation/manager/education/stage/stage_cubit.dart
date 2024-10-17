import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';

import '../../../../domain/use_cases/education_type_use_case.dart';

part 'stage_state.dart';

class StageCubit extends Cubit<StageState> {
  StageCubit(this.useCase) : super(StageInitial());
  EducationTypeUseCase useCase;
  bool isProgramDone = false;
  List<PublicDataModel> stageData=[];
  int? gradeId;
  getGrade({
    required int educationProgramsId,
    required int educationTypeId,
  }) {
    managerExecute<List<PublicDataModel>>(
        useCase.getGrade(
            educationProgramsId: educationProgramsId,
            educationTypeId: educationTypeId),
        onStart: () => emit(GradeLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          isProgramDone = true;
          stageData=data!;
          emit(GradeLoadedState(data: data));
        },
        onFail: (message) => emit(GradeFailureState(message: message)));
  }
}
