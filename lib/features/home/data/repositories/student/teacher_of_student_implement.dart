import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/teachers_of_student_data_source.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import '../../../domain/repositories/student/courses_repo.dart';
import '../../../domain/repositories/student/teacher_of_student_repo.dart';
import '../../data_sources/student/ads_data_source.dart';

class TeacherOfStudentImplement extends TeacherOfStudentRepo {
  TeachersOfStudentDataSource adsDataSource;
  TeacherOfStudentImplement(this.adsDataSource);

  @override
  Future<Either<Failure, ResponseModel>> getTeacherOfStudent()=> execute(
        () => adsDataSource.getTeachersOfStudent(),
  );
}
