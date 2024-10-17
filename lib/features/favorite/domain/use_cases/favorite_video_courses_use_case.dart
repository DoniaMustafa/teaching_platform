import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';

 class FavoriteVideoCoursesUseCase {
   FavoriteVideoCoursesUseCase(this.repo);
   FavoriteVideoCoursesRepo repo;
  Future<Either<Failure,ResponseModel>>getFavoriteVideoCourses()=>repo.getFavoriteVideoCourses();
}

