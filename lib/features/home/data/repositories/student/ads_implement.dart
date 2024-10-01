import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_groups_data_source.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import '../../../domain/repositories/student/courses_groups_repo.dart';
import '../../data_sources/student/ads_data_source.dart';

class AdsImplement extends AdsRepo {
  AdsDataSource adsDataSource;
  AdsImplement(this.adsDataSource);

  @override
  Future<Either<Failure, ResponseModel>> getAds()=> execute(
        () => adsDataSource.getAds(),
  );
}
