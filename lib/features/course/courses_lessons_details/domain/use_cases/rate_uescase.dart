import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/rate_repo.dart';

class RateUseCase {
  RateRepo repo;
  Future<Either<Failure, ResponseModel>> addRate(
          {int? videoId, int? rate}) async =>
      await repo.addRate(videoId: videoId, rate: rate);

  RateUseCase(this.repo);
}
