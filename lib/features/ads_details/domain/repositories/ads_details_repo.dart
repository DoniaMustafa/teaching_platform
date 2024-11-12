import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class AdsDetailsRepo {
  Future<Either<Failure,ResponseModel>> getAdvertisementsDetails({required int id});
}

