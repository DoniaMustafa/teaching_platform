import 'package:dartz/dartz.dart';
import 'package:teaching/features/auth/domain/repositories/countries_repo.dart';
import '../../../../core/export/export.dart';

class CountriesUseCase {
  CountriesRepo repo;
  Future<Either<Failure, ResponseModel>> getCountries() async =>
      await repo.getCountries();
  Future<Either<Failure,ResponseModel>> getCities({required int countryId}) async =>
      await repo.getCities(countryId:countryId);
Future<Either<Failure,ResponseModel>> getRegion({required int cityId}) async =>
    await repo.getRegion(cityId:cityId);
CountriesUseCase(this.repo);
}
