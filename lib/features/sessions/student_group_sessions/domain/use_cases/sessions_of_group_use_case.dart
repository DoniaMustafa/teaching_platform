 import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../repositories/sessions_of_group_repo.dart';

class SessionsOfGroupUseCase {
   SessionsOfGroupRepo repo;

  Future<Either<Failure,ResponseModel>> getSessionsOfGroup({required int groupId})=>repo.getSessionsOfGroup(groupId: groupId);

   SessionsOfGroupUseCase(this.repo);
}