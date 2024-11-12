import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/ads_details/data/models/ads_details_model.dart';
import 'package:teaching/features/ads_details/domain/use_cases/ads_details_use_case.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
import 'package:teaching/features/near_school_details/domain/use_cases/near_school_details_use_case.dart';


class AdsDetailsCubit extends Cubit<CubitStates> {
  AdsDetailsCubit(this.useCase) : super(InitialState());
  AdsDetailsUseCase useCase;
  getAdvertisementsDetails({required int id}){
    managerExecute<AdsDetailsModel>(useCase.getAdvertisementsDetails(id: id),
    onStart: ()=>emit(LoadingState()),
      onFail: (message)=>emit(FailedState(message: message)),
      onSuccess: (data)=>emit(LoadedState<AdsDetailsModel>(data: data!))

    );
  }
}
