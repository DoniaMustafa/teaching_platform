import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class AdsRepo {

  Future<Either<Failure,ResponseModel>> getAds();

}