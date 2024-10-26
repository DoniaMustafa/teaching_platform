import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';
import 'package:teaching/features/notification/domain/use_cases/notification_use_case.dart';
import 'package:teaching/features/notification/presentation/manager/notification_cubit.dart';

class NotificationOperationCubit extends Cubit<CubitStates> {
  NotificationOperationCubit(this.useCase) : super(InitialState());
  NotificationUseCase useCase;
  List<bool> isRead = [];

  getMarkNotificationAsRead({required int id, required int index}) {
    managerExecute<Null>(useCase.getMarkNotificationAsRead(id: id),
        onStart: () {
      isRead[index] = true;
      emit(LoadingState());
    }, onFail: (message) {
      isRead[index] = false;
      emit(FailedState(message: message));
    }, onSuccess: (data) {
      isRead[index] = true;
      emit(LoadedState<Null>(data: null));
    });
  }
}
