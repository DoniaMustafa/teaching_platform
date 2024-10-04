import 'package:dartz/dartz.dart';
import '../../../../core/export/export.dart';

abstract class CountriesRepo {
  Future<Either<Failure,ResponseModel>> getCountries();
}
