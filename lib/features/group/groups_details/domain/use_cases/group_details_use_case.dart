 import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/groups_details/domain/repositories/group_details_repo.dart';

class GroupDetailsUseCase {
   GroupDetailsRepo repo;

   GroupDetailsUseCase(this.repo);

   Future<Either<Failure,ResponseModel>> getGroupDetails({required int teacherId, int? subjectId})async=>
       await repo.getGroupDetails(teacherId:teacherId ,subjectId:subjectId );
}
