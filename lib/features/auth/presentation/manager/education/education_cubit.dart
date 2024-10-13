import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/domain/use_cases/education_type_use_case.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';

import '../../../data/models/contry_response_model.dart';
part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit(this.useCase) : super(EducationInitial());
  EducationTypeUseCase useCase;
  // bool isEducationTypeDone = false;
  // bool isProgramDone = false;

  bool isEducationTypeDone = false;

  // int? curriculumId;
  // bool isProgramDone = false;
  //
  // int? gradeId;
  int? typeId;

  getEducationType() {
    managerExecute<List<PublicDataModel>>(useCase.getEducationType(),
        onStart: () => emit(EducationTypeLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {

          emit(EducationTypeLoadedState(data: data!));
        },
        onFail: (message) => emit(EducationTypeFailureState(message: message)));
  }



  //
  // getEducationPrograms({required int id}) {
  //   managerExecute<List<PublicDataModel>>(useCase.getEducationPrograms(id: id),
  //       onStart: () => emit(EducationProgramsLoadingState()),
  //       onSuccess: (List<PublicDataModel>? data) {
  //         isEducationTypeDone = true;
  //         emit(EducationProgramsLoadedState(data: data!));
  //       },
  //       onFail: (message) =>
  //           emit(EducationProgramsFailureState(message: message)));
  // }
  //
  //
  //
  //
  // getGrade({
  //   required int educationProgramsId,
  //   required int educationTypeId,
  // }) {
  //   managerExecute<List<PublicDataModel>>(
  //       useCase.getGrade(
  //           educationProgramsId: educationProgramsId,
  //           educationTypeId: educationTypeId),
  //       onStart: () => emit(GradeLoadingState()),
  //       onSuccess: (List<PublicDataModel>? data) {
  //         isProgramDone = true;
  //         emit(GradeLoadedState(data: data!));
  //       },
  //       onFail: (message) => emit(GradeFailureState(message: message)));
  // }
}
