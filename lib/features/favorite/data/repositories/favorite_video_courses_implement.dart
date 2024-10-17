import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/data_sources/favorite_video_courses_data_source.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';

class FavoriteVideoCoursesImplement extends FavoriteVideoCoursesRepo {
  FavoriteVideoCoursesDataSource dataSource;
  FavoriteVideoCoursesImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getFavoriteVideoCourses() =>
      execute(() => dataSource.getFavoriteVideoCourses());
}
