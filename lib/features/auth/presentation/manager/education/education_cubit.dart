import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/domain/use_cases/education_type_use_case.dart';

import '../../../data/models/contry_response_model.dart';
part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit(this.useCase) : super(EducationInitial());
  EducationTypeUseCase useCase;
  // bool isEducationTypeDone = false;
  // bool isProgramDone = false;


  int? typeId;

  getEducationType() {
    managerExecute<List<PublicDataModel>>(useCase.getEducationType(),
        onStart: () => emit(EducationTypeLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          // print(isEducationTypeDone);

          emit(EducationTypeLoadedState(data: data!));
        },
        onFail: (message) => emit(EducationTypeFailureState(message: message)));
  }


}
