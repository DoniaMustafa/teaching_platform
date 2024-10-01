import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/subscription_use_case.dart';



class SubscriptionCubit extends Cubit<CubitStates> {
  SubscriptionCubit(this.useCase) : super(InitialState());
  SubscriptionUseCase useCase;
  getSubscription() {
    managerExecute<CoursesAndGroupsDataModel>(
      useCase.getSubscription(),
      onSuccess: (data) =>
          emit(LoadedState<CoursesAndGroupsDataModel>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }

}
