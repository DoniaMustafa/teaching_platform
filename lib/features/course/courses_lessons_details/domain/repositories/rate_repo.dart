import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class RateRepo {
  Future<Either<Failure,ResponseModel>> addRate({int? videoId, int? rate,bool isCourse = true});
}

