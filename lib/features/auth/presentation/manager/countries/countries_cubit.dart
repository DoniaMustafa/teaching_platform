import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helper/app_helper.dart';
import '../../../../../core/list_states.dart';
import '../../../data/models/contry_response_model.dart';
import '../../../domain/use_cases/countries_use_case.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(this.useCase) : super(CountriesInitial());
  CountriesUseCase useCase;
  getCountries() {
    managerExecute<List<PublicDataModel>>(useCase.getCountries(),
        onStart: () => emit(CountriesLoadingState()),
        onSuccess: (List<PublicDataModel>? data) {
          data = data;
          emit(CountriesLoadedState(date: data!));
        },
        onFail: (message) => emit(CountriesErrorState(message: message)));
  }
}
