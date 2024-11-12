import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helper/app_helper.dart';
import '../../../../../core/list_states.dart';
import '../../../data/models/contry_response_model.dart';
import '../../../domain/use_cases/countries_use_case.dart';

class RegionCubit extends Cubit<CubitStates> {
  RegionCubit(this.useCase) : super(InitialState());
  CountriesUseCase useCase;
  bool isGetCitiesDone = false;
  List<PublicDataModel> region = [];
  getRegion({required int cityId}) {
    managerExecute<List<PublicDataModel>>(useCase.getRegion(cityId: cityId),
        onStart: () => emit(LoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          region = data!;
          isGetCitiesDone = true;
          emit(LoadedState<List<PublicDataModel>>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }
}
