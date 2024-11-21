import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/favorite_video_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/favorite_unfavorite_video_repo.dart';



class FavoriteVideoImplement extends FavoriteUnFavoriteVideoRepo {
  FavoriteVideoDataSource dataSource;



      FavoriteVideoImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> addFavoriteUnFavoriteVideo({int? videoId,bool isCourse=true})=>
      execute(() => dataSource.addFavoriteVideo( videoId: videoId,isCourse: isCourse));
}
