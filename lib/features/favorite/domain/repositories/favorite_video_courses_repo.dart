import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class FavoriteVideoCoursesRepo {

  Future<Either<Failure,ResponseModel>>getFavoriteVideoCourses();
}

