import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/data_sources/sessions_of_group_date_source.dart';
import 'package:teaching/features/sessions/student_group_sessions/domain/repositories/sessions_of_group_repo.dart';

class SessionsOfGroupImplement extends SessionsOfGroupRepo{

  SessionsOfGroupDateSource dateSource;
  @override
  Future<Either<Failure, ResponseModel>> getSessionsOfGroup({required int groupId}) =>
  execute(()=>dateSource.getSessionsOfGroup(groupId: groupId));

  SessionsOfGroupImplement(this.dateSource);
}