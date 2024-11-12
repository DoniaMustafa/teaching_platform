import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/rate_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/rate_repo.dart';

class RateImplement extends RateRepo {
  RateDataSource dataSource;

  RateImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> addRate({int? videoId, int? rate,bool isCourse = true}) =>
      execute(() => dataSource.addRate(rate: rate, videoId: videoId,isCourse: isCourse));
}
