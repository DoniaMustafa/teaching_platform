import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/domain/repositories/user_transaction_repo.dart';

 class UserTransactionUseCase {
   UserTransactionRepo repo;
  Future<Either<Failure,ResponseModel>> getBalance()=>repo.getBalance();
  Future<Either<Failure,ResponseModel>> getUserTransaction()=>repo.getUserTransaction();

   UserTransactionUseCase(this.repo);
}

