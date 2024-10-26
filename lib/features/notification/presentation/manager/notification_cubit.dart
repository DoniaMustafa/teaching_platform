import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';
import 'package:teaching/features/notification/domain/use_cases/notification_use_case.dart';
import 'package:teaching/features/notification/presentation/manager/notification_operation_cubit.dart';

class NotificationCubit extends Cubit<CubitStates> {
  NotificationCubit(this.useCase) : super(InitialState());
  NotificationUseCase useCase;

  getNotification() {
    managerExecute<List<NotificationDataModel>>(useCase.getNotification(),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (List<NotificationDataModel>? data) {
          data!.forEach((element) {
            AppService().getBlocData<NotificationOperationCubit>().isRead.addAll({element.isRead!});
            // AppService().getBlocData<NotificationOperationCubit>().isRead = element.isRead!;
          });

          emit(LoadedState<List<NotificationDataModel>>(data: data));
        });
  }
}
