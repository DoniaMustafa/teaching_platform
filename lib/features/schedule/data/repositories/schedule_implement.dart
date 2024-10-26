import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/schedule/data/data_sources/schedule_data_source.dart';
import 'package:teaching/features/schedule/domain/repositories/schedule_repo.dart';

class ScheduleImplement extends ScheduleRepo {
  ScheduleImplement(this.dataSource);

  ScheduleDataSource dataSource;
  @override
  Future<Either<Failure,ResponseModel>> getSchedule({required String selectedDay})async =>
  execute(()=>dataSource.getSchedule(selectedDay: selectedDay));

}
