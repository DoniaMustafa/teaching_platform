import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/domain/use_cases/subscription_group_use_case.dart';

class SubscriptionGroupCubit extends Cubit<CubitStates> {
  SubscriptionGroupCubit(this.useCase) : super(InitialState());
  SubscriptionGroupUseCase useCase;
  bool isSubscribed=GroupsLessonDetailsScreen.isSubscribe;
  subscriptionGroup(int groupId) {
    executeWithDialog(
      either: useCase.subscriptionGroup(groupId: groupId),
      startingMessage: AppStrings().loading.trans,
      onSuccess: (data) {
        isSubscribed=true;
        emit(LoadedState<dynamic>(data: data));
      },
      onStart: () => emit(LoadingState()),
      onError: (message) {
        isSubscribed=false;
        emit(FailedState(message: message));
      },
    );
  }
}
