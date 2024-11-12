import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
import 'package:teaching/features/near_school_details/domain/use_cases/near_school_details_use_case.dart';


class NearSchoolDetailsCubit extends Cubit<CubitStates> {
  NearSchoolDetailsCubit(this.useCase) : super(InitialState());
  NearSchoolDetailsUseCase useCase;
  getNearSchoolDetails({required int id}){
    managerExecute<SchoolDetailsModel>(useCase.getNearSchoolDetails(id: id),
    onStart: ()=>emit(LoadingState()),
      onFail: (message)=>emit(FailedState(message: message)),
      onSuccess: (data)=>emit(LoadedState<SchoolDetailsModel>(data: data!))

    );
  }
}
