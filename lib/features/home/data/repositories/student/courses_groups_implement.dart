import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import '../../../domain/repositories/student/courses_repo.dart';

class CoursesImplement extends CoursesRepo {
  CoursesDataSource courses;
  CoursesImplement(this.courses);

  @override
  Future<Either<Failure, ResponseModel>> getCourser({int? subjectId}) => execute(
        () => courses.getCourser(subjectId:subjectId ),
      );
}
