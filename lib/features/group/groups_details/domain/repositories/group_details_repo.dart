import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class GroupDetailsRepo {
  Future<Either<Failure,ResponseModel>> getGroupDetails({required int teacherId, int? subjectId});
}
