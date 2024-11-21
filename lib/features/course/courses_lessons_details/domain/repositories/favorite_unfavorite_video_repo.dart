import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class FavoriteUnFavoriteVideoRepo {
  Future<Either<Failure,ResponseModel>> addFavoriteUnFavoriteVideo({int? videoId,bool isCourse=true});
}

