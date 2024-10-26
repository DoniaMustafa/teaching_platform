import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/favorite_unfavorite_video_repo.dart';
 class FavoriteUnfavoriteVideoUseCase {
  FavoriteUnFavoriteVideoRepo repo;
  Future<Either<Failure, ResponseModel>> addFavoriteUnFavoriteVideo({
    int? videoId,
  }) =>
      repo.addFavoriteUnFavoriteVideo(videoId: videoId);

  FavoriteUnfavoriteVideoUseCase(this.repo);
}
