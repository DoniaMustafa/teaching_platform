import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/data/data_sources/user_transaction.dart';
import 'package:teaching/features/wallet/data/models/balance_response_model.dart';
import 'package:teaching/features/wallet/data/models/transaction_response_model.dart';
import 'package:teaching/features/wallet/domain/repositories/user_transaction_repo.dart';



class UserTransactionImplement extends UserTransactionRepo{
  UserTransactionDataSource  dataSource;

  UserTransactionImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getBalance() =>execute(()=>dataSource.getBalance());

  @override
  Future<Either<Failure, ResponseModel>> getUserTransaction()=>execute(()=>dataSource.getUserTransaction());
}
