import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/teacher/teachers/data/data_sources/teachers_of_student_data_source.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import '../../../../home/domain/repositories/student/courses_repo.dart';
import '../../domain/repositories/teacher_of_student_repo.dart';
import '../../../../home/data/data_sources/student/ads_data_source.dart';

class TeacherOfStudentImplement extends TeacherOfStudentRepo {
  TeachersOfStudentDataSource adsDataSource;
  TeacherOfStudentImplement(this.adsDataSource);

  @override
  Future<Either<Failure, ResponseModel>> getTeacherOfStudent({TeacherModel? model})=> execute(
        () => adsDataSource.getTeachersOfStudent(model: model),
  );
}
