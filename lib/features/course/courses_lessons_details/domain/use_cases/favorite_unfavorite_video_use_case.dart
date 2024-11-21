import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/favorite_unfavorite_video_repo.dart';
 class FavoriteUnfavoriteVideoUseCase {
  FavoriteUnFavoriteVideoRepo repo;
  Future<Either<Failure, ResponseModel>> addFavoriteUnFavoriteVideo({
    int? videoId,bool isCourse=true
  }) =>
      repo.addFavoriteUnFavoriteVideo(videoId: videoId,isCourse:isCourse );

  FavoriteUnfavoriteVideoUseCase(this.repo);
}
