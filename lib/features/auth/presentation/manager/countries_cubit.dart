import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/domain/use_cases/countries_use_case.dart';

class CountriesCubit extends Cubit<CubitStates> {
  CountriesCubit(this.useCase) : super(InitialState());
  CountriesUseCase useCase;

  getCountries() {
    managerExecute<List<CountryDataModel>>(useCase.getCountries(),
        onStart: () => emit(LoadingState()),
        onSuccess: (List<CountryDataModel>? data) =>
            LoadedState<List<CountryDataModel>>(data: data!),
        onFail: (message) => emit(FailedState(message: message)));
  }
}
