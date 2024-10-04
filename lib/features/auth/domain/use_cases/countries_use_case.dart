import 'package:dartz/dartz.dart';
import 'package:teaching/features/auth/domain/repositories/countries_repo.dart';
import '../../../../core/export/export.dart';

class CountriesUseCase {
  CountriesRepo repo;
  Future<Either<Failure, ResponseModel>> getCountries() async =>
      await repo.getCountries();

  CountriesUseCase(this.repo);
}
