import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_repo.dart';

import '../../../../home/domain/repositories/student/ads_repo.dart';
import '../repositories/teacher_of_student_repo.dart';

class TeacherOfStudentUseCase {
  TeacherOfStudentRepo repo;
  TeacherOfStudentUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getTeacherOfStudent
      ({TeacherModel? model}) =>
      repo.getTeacherOfStudent(model:model );
}