import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/data/models/transaction_response_model.dart';
import 'package:teaching/features/wallet/domain/use_cases/user_transaction_use_case.dart';

class TransactionCubit extends Cubit<CubitStates> {
  TransactionCubit(this.useCase) : super(InitialState());

  UserTransactionUseCase useCase;

  getTransaction() {
    managerExecute<List<TransactionData>>(
      useCase.getUserTransaction(),
      onStart: () => emit(LoadingState()),
      onFail: (message) => emit(FailedState(message: message)),
      onSuccess: (data) => emit(LoadedState<List<TransactionData>>(data: data!)),
    );
  }
}
