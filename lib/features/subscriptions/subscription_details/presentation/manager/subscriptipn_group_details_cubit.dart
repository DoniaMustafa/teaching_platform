import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscriptions/subscription_details/domain/use_cases/subscription_details_use_Case.dart';

class SubscriptionGroupDetailsCubit extends Cubit<CubitStates> {
  SubscriptionGroupDetailsCubit(this.useCase) : super(InitialState());

  SubscriptionDetailsUseCase useCase;
  getSubscriptionGroupDetails({TeacherModel? model}) {
    managerExecute<List<GroupDetailsDataModel>>(
        useCase.getSubscribeGroupDetails(model: model!),
        onSuccess: (data) {
          emit(LoadedState<List<GroupDetailsDataModel>>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)),
        onStart: () => emit(LoadingState()));
  }
}
