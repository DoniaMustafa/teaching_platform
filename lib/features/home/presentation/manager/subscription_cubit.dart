import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/subscription_use_case.dart';

import '../../../subscription/data/models/subscription_response_model.dart';



class SubscriptionCubit extends Cubit<CubitStates> {
  SubscriptionCubit(this.useCase) : super(InitialState());
  SubscriptionUseCase useCase;

  getSubscription() {
    managerExecute<CoursesDataModel>(
      useCase.getSubscription(),
      onSuccess: (data) {

        emit(LoadedState<CoursesDataModel>(data: data!));
      },
      onFail: (message) => emit(FailedState(message: message)),
    );
  }

}
