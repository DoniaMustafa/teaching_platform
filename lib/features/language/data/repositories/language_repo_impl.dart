
import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../../domain/repositories/language_repo.dart';
import '../data_sources/language_local_datasource.dart';

class LanguageRepoImpl extends LanguageRepo {
  final LanguageLocalDataSource languageLocalDataSource;

  LanguageRepoImpl({required this.languageLocalDataSource});

  @override
  Future<Either<Failure, ResponseModel>> changeLanguage({required String language}) async => executeCache(
        () => languageLocalDataSource.changeLanguage(language: language),
  );

  @override
  Future<Either<Failure, ResponseModel>> getSavedLanguage() async => executeCache(
        () => languageLocalDataSource.getSavedLanguage(),
  );
}
