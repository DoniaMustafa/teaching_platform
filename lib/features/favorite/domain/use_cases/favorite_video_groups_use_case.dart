import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_groups_repo.dart';

 class FavoriteVideoGroupsUseCase {
   FavoriteVideoGroupsUseCase(this.repo);
   FavoriteVideoGroupsRepo repo;
  Future<Either<Failure,ResponseModel>>getFavoriteVideoGroups()=>repo.getFavoriteVideoGroups();
}

