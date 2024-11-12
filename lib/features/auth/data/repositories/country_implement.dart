import 'package:dartz/dartz.dart';
import 'package:teaching/features/auth/data/data_sources/country_remote_datasource.dart';
import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import 'package:teaching/features/auth/domain/repositories/countries_repo.dart';
import '../../../../core/export/export.dart';

 class CountryImplement extends CountriesRepo {
   CountryRemoteDatasource datasource;

  @override
  Future<Either<Failure, ResponseModel>> getCountries() async =>
      execute(
            () => datasource.getCountries(),
      );

   CountryImplement(this.datasource);

  @override
  Future<Either<Failure, ResponseModel>> getCities({required int countryId}) async =>
      execute(
            () => datasource.getCities(countryId: countryId),
      );

  @override
  Future<Either<Failure, ResponseModel>> getRegion({required int cityId}) async =>
      execute(
            () => datasource.getRegion(cityId:cityId),
      );
}
