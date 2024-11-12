import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';

import '../../domain/repositories/ads_details_repo.dart';
import '../data_sources/ads_details_data_source.dart';


class AdsDetailsImplement extends AdsDetailsRepo {
  AdsDetailsDataSource dataSource;

  @override
  Future<Either<Failure,ResponseModel>> getAdvertisementsDetails({required int id}) async =>
      execute(()=>dataSource.getAdvertisementsDetails(id: id));

  AdsDetailsImplement(this.dataSource);

}
