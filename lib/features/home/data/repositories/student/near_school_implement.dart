import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/near_school_data_source.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import '../../../domain/repositories/student/courses_repo.dart';
import '../../../domain/repositories/student/near_school_repo.dart';
import '../../data_sources/student/ads_data_source.dart';

class NearSchoolImplement extends NearSchoolRepo {
  NearSchoolDataSource dataSource;
  NearSchoolImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getNearSchool()=> execute(
        () => dataSource.getNearSchool(),
  );
}
