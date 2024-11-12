import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';

import '../../domain/repositories/near_school_details_repo.dart';
import '../data_sources/near_school_details_data_sourec.dart';


class NearSchoolDetailsImplement extends NearSchoolDetailsRepo {
  NearSchoolDetailsDataSource dataSource;

  @override
  Future<Either<Failure,ResponseModel>> getNearSchoolDetails({required int id}) async =>
      execute(()=>dataSource.getNearSchoolDetails(id: id));

  NearSchoolDetailsImplement(this.dataSource);

}
