import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class GroupsRepo {

  Future<Either<Failure,ResponseModel>> getGroups({int? subjectId});

}