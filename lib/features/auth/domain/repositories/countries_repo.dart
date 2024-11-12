import 'package:dartz/dartz.dart';
import '../../../../core/export/export.dart';

abstract class CountriesRepo {
  Future<Either<Failure,ResponseModel>> getCountries();
   Future<Either<Failure,ResponseModel>> getCities({required int countryId});
   Future<Either<Failure,ResponseModel>> getRegion({required int cityId});
}
