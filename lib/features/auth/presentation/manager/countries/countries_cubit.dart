import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helper/app_helper.dart';
import '../../../../../core/list_states.dart';
import '../../../data/models/contry_response_model.dart';
import '../../../domain/use_cases/countries_use_case.dart';

class CountriesCubit extends Cubit<CubitStates> {
  CountriesCubit(this.useCase) : super(InitialState());
  CountriesUseCase useCase;
  getCountries() {
    managerExecute<List<PublicDataModel>>(useCase.getCountries(),
        onStart: () => emit(LoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          data = data;
          emit(LoadedState<List<PublicDataModel>>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }
}
