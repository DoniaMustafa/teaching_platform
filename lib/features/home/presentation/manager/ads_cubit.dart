import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/ads_use_case.dart';

class AdsCubit extends Cubit<CubitStates> {
  AdsCubit(this.useCase) : super(InitialState());
  AdsUseCase useCase;

  getAds() {
    managerExecute<List<GenericDataModel>>(
      useCase.getAds(),onStart: ()=> emit(LoadingState()),
      onSuccess: (List<GenericDataModel>? data) =>
          emit(LoadedState<List<GenericDataModel>>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
