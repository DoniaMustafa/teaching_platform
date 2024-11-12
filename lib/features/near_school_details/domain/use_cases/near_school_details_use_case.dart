import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/near_school_details/domain/repositories/near_school_details_repo.dart';

 class NearSchoolDetailsUseCase{
   NearSchoolDetailsRepo repo;
  Future<Either<Failure,ResponseModel>> getNearSchoolDetails({required int id})=>repo.getNearSchoolDetails(id: id);

   NearSchoolDetailsUseCase(this.repo);
}

