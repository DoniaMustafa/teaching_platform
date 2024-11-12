import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/ads_details/domain/repositories/ads_details_repo.dart';
import 'package:teaching/features/near_school_details/domain/repositories/near_school_details_repo.dart';

 class AdsDetailsUseCase{
   AdsDetailsRepo repo;
  Future<Either<Failure,ResponseModel>> getAdvertisementsDetails({required int id})=>repo.getAdvertisementsDetails(id: id);

   AdsDetailsUseCase(this.repo);
}

