import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/data/models/balance_response_model.dart';
import 'package:teaching/features/wallet/data/models/transaction_response_model.dart';

abstract class UserTransactionDataSource {
  Future<ResponseModel> getBalance();
  Future<ResponseModel> getUserTransaction();
}

class UserTransactionWithServer extends UserTransactionDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getBalance() async => remoteExecute(
      request: dioConsumer.getRequest(path: EndPoints.getBalance),
      fromJsonFunction: BalanceResponseModel.fromJson);
  @override
  Future<ResponseModel> getUserTransaction() async => remoteExecute(
      request: dioConsumer.getRequest(path: EndPoints.getTransaction),
      fromJsonFunction: TransactionResponseModel.fromJson);

  UserTransactionWithServer(this.dioConsumer);
}
