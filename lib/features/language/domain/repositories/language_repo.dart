import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class LanguageRepo {
  Future<Either<Failure, ResponseModel>> changeLanguage({required String language});
  Future<Either<Failure, ResponseModel>> getSavedLanguage();
}
