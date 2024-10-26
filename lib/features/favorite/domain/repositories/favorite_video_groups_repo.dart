import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class FavoriteVideoGroupsRepo {

  Future<Either<Failure,ResponseModel>>getFavoriteVideoGroups();
}

