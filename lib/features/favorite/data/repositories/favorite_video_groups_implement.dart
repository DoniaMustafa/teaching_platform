import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/data_sources/favorite_video_courses_data_source.dart';
import 'package:teaching/features/favorite/data/data_sources/favorite_video_group_data_source.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_groups_repo.dart';

class FavoriteVideoGroupsImplement extends FavoriteVideoGroupsRepo {
  FavoriteVideoGroupDataSource dataSource;
  FavoriteVideoGroupsImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getFavoriteVideoGroups() =>
      execute(() => dataSource.getFavoriteVideoGroups());
}
