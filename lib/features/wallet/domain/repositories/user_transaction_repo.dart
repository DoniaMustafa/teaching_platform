import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class UserTransactionRepo {
  Future<Either<Failure,ResponseModel>> getBalance();
  Future<Either<Failure,ResponseModel>> getUserTransaction();
}

