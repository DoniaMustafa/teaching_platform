import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/data/models/balance_response_model.dart';
import 'package:teaching/features/wallet/domain/use_cases/user_transaction_use_case.dart';

class BalanceCubit extends Cubit<CubitStates> {
  BalanceCubit(this.useCase) : super(InitialState());

  UserTransactionUseCase useCase;

  getBalance() {
    managerExecute<BalanceDataModel>(
      useCase.getBalance(),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) => emit(LoadedState<BalanceDataModel>(data: data!)),
    );
  }

}
