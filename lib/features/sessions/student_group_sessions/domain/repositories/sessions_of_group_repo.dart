import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class SessionsOfGroupRepo {
  Future<Either<Failure,ResponseModel>> getSessionsOfGroup({required int groupId});
}